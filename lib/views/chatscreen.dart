
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:response/functionalities/speech.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _messages = [];
  bool _isTyping = false;

  // Create an instance of the SpeechService
  final SpeechService _speechService = SpeechService();

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  // Initialize speech recognition
  void _initSpeech() async {
    await _speechService.initSpeech();
    setState(() {});
  }

  // Start or stop listening when the mic button is pressed
  void _toggleListening() async {
    Fluttertoast.showToast(
      msg: "Please Speak and keep speaking",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
    );
    if (_speechService.isListening) {
      await _speechService.stopListening();
    } else {
      await _speechService.startListening(onSpeechResult);
    }
    setState(() {});
  }

  // Handle speech input result
  void onSpeechResult(result) {
    setState(() {
      _controller.text = result.recognizedWords;  // Update the text field with recognized words
    });
    // Update the last speech time whenever new speech is detected
    _speechService.lastSpeechTime = DateTime.now();
  }

  // Send text message
  void _sendMessage() {
    if (_controller.text.isNotEmpty && !_isTyping) {
      setState(() {
        _messages.add({
          'text': _controller.text,
          'isUser': true,
          'type': 'text', // Text message type
        });
        _controller.clear();
        _isTyping = true;
      });

      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          _messages.add({
            'text': "Ok, this is accepted",
            'isUser': false,
            'type': 'text',
          });
          _isTyping = false;
        });
      });
    } else {
      Fluttertoast.showToast(
        msg: "Please enter something, it cannot be null.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
      );
    }
  }

  @override
  void dispose() {
    _speechService.cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Docbot", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFEF6D35),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  bool isUserMessage = _messages[index]['isUser'];
                  if (_messages[index]['type'] == 'text') {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment:
                        isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
                        children: [
                          if (!isUserMessage) ...[
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Color(0xFFEF6D35),
                              child: Icon(Icons.account_circle, color: Colors.white, size: 25),
                            ),
                            SizedBox(width: 8),
                          ],
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0),
                                bottomLeft: isUserMessage ? Radius.circular(15.0) : Radius.circular(0),
                                bottomRight: !isUserMessage ? Radius.circular(15.0) : Radius.circular(0),
                              ),
                            ),
                            child: Text(_messages[index]['text'], style: TextStyle(color: Color(0xFF616161))),
                          ),
                          if (isUserMessage) ...[
                            SizedBox(width: 8),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Color(0xFFEF6D35),
                              child: Icon(Icons.account_circle, color: Colors.white, size: 25),
                            ),
                          ],
                        ],
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.mic),
                  onPressed: _toggleListening,
                  color: _speechService.isListening ? Colors.blue : Color(0xFFEF6D35),
                ),
                Expanded(
                  child: TextField(
                    minLines: 1,
                    maxLines: 5,
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter your query here',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                      fillColor: Color(0xFFEEEEEE),
                      filled: true,
                    ),
                    style: TextStyle(color: Color(0xFF616161)),
                    onSubmitted: (text) => _sendMessage(),
                    enabled: !_isTyping,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                  color: _isTyping ? Colors.grey : Color(0xFFEF6D35),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
