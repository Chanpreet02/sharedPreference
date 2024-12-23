/*
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [];
  bool _isLoading = false;

  // Function to send message to backend API
  Future<void> sendMessage(String message) async {
    setState(() {
      _isLoading = true;
    });

    // try {
    //   // Replace with your backend URL
    //   final response = await http.post(
    //     Uri.parse('http://your-backend-api.com/chat'),
    //     headers: <String, String>{
    //       'Content-Type': 'application/json',
    //     },
    //     body: jsonEncode(<String, String>{
    //       'message': message,
    //     }),
    //   );
    //
    //   if (response.statusCode == 200) {
    //     // Assuming the backend returns a response with the chatbot's message
    //     var data = jsonDecode(response.body);
    //     String botMessage = data['response'];
    //
    //     setState(() {
    //       messages.add({'sender': 'user', 'message': message});
    //       messages.add({'sender': 'bot', 'message': botMessage});
    //       _controller.clear();
    //       _isLoading = false;
    //     });
    //   } else {
    //     // Handle error
    //     setState(() {
    //       _isLoading = false;
    //     });
    //     print('Failed to get response from the backend');
    //   }
    // } catch (e) {
    //   setState(() {
    //     _isLoading = false;
    //   });
    //   print('Error: $e');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Chatbot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Align(
                    alignment: messages[index]['sender'] == 'user'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: messages[index]['sender'] == 'user'
                            ? Colors.blueAccent
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        messages[index]['message']!,
                        style: TextStyle(
                          color: messages[index]['sender'] == 'user'
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (_isLoading)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      sendMessage(_controller.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/
/*
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [
    {'sender': 'bot', 'message': 'Hello! How can I assist you today?'},
    {'sender': 'user', 'message': 'I need help with my account.'},
    {'sender': 'bot', 'message': 'Sure, I can help with that.'},
  ];

  bool _isLoading = false;

  // Function to simulate sending a message (static)
  void sendMessage(String message) {
    setState(() {
      messages.add({'sender': 'user', 'message': message});
      messages.add({'sender': 'bot', 'message': 'This is a static response.'});
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Chatbot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: messages[index]['sender'] == 'user'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: messages[index]['sender'] == 'user'
                            ? Colors.blueAccent
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        messages[index]['message']!,
                        style: TextStyle(
                          color: messages[index]['sender'] == 'user'
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (_isLoading)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      sendMessage(_controller.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/
/*
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatbot"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/chatbot.jpg",
              height: 100,
              width: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Your DocBot',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
            SizedBox(height: 10),
            Text(
              'Resolve your queries wherever you are.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'DocBot is always here to help.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: ' Enter your query here',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

/*
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();
  List<ChatMessage> _messages = <ChatMessage>[];
  bool _showImage = true;
  final ChatUser _currUser = ChatUser(id: '1', firstName: 'Chanpreet', lastName: 'Singh');
  final ChatUser _gptUser = ChatUser(id: '2', firstName: 'Doc', lastName: 'Bot');
  final OpenAI _openAI = OpenAI.instance.build(token: api_Key, baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 3)),enableLog: true);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Docbot", style:TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFEF6D35), // Light orange color for the AppBar
      ),
      body: DashChat(
          currentUser: _currUser,
          onSend: (ChatMessage m){
        _getChatResponse(m);
      },
          messages: _messages ),
    );
  }

  Future <void> _getChatResponse(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m);
    });

    List<Messages> _messageHistory = _messages.reversed.map((m){
      if(m.user == _currUser){
        return Messages(role: Role.user, content: m.text);
      } else{
        return Messages(role: Role.assistant, content: m.text);
      }
    }).toList();

    final request = ChatCompleteText(model: GptTurbo0301ChatModel(), messages: _messageHistory, maxToken: 300,);

  }
}
*/

/*
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();
  List<ChatMessage> _messages = <ChatMessage>[];
  bool _showImage = true;
  final ChatUser _currUser = ChatUser(id: '1', firstName: 'Chanpreet', lastName: 'Singh');
  final ChatUser _gptUser = ChatUser(id: '2', firstName: 'Doc', lastName: 'Bot');
  final OpenAI _openAI = OpenAI.instance.build(
    token: api_Key,
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
    ),
    enableLog: true,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Docbot", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFEF6D35),
      ),
      body: DashChat(
        currentUser: _currUser,
        onSend: (ChatMessage m) {
          _getChatResponse(m);
        },
        messages: _messages,
      ),
    );
  }

  Future<void> _getChatResponse(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m);
    });

    // Create the message history list for GPT model input
    List<Messages> _messageHistory = _messages.reversed.map((m) {
      if (m.user == _currUser) {
        return Messages(role: Role.user, content: m.text);  // User message
      } else {
        return Messages(role: Role.assistant, content: m.text);  // GPT Bot message
      }
    }).toList();

    // Convert the message history to a list of maps for the API request
    List<Map<String, dynamic>> messageMapList = _messageHistory.map((message) => message.toJson()).toList();

    // Define the request using gpt-3.5-turbo-16k model
    final request = ChatCompleteText(
      model: GptTurboChatModel(),
      messages: messageMapList,
      maxToken: 300,
    );

    // Make the request to the OpenAI API for a response
    final response = await _openAI.onChatCompletion(request: request);

    // Handle the response and update the chat messages
    for (var element in response!.choices) {
      if (element.message != null) {
        setState(() {
          _messages.insert(0, ChatMessage(user: _gptUser, createdAt: DateTime.now(), text: element.message!.content));
        });
      }
    }
  }
}
*/


/*
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();
  List<String> _messages = [];
  bool _showImage = true;

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text);
        _controller.clear();
        _showImage = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Docbot", style:TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFEF6D35), // Light orange color for the AppBar
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_showImage)
              Center(
                child: Image.asset(
                  "assets/image/chatbot.jpg",
                  height: 100,
                  width: 100,
                ),
              ),
            SizedBox(height: 20),
            if (_showImage) ...[
              Center(
                child: Column(
                  children: [
                    Text(
                      'Your DocBot',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFEF6D35)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Resolve your queries wherever you are.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'DocBot is always here to help.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
            SizedBox(height: 40),

            // Display messages
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0),
                                bottomLeft: Radius.circular(15.0),
                              ),
                            ),
                            child: Text(
                              _messages[index],
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/image/profile_icon.png'), // Replace with your profile image
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter your query here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onSubmitted: (text) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/



/*
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:response/views/home_page.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int counter = 0;
  TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _messages = [];
  bool _showImage = true;
  bool _isTyping = false;

  void _sendMessage() {
    if (_controller.text.isNotEmpty && !_isTyping) {
      setState(() {
        _showImage = false;
        _messages.add({
          'text': _controller.text,
          'isUser': true,
        });
        _controller.clear();
        _isTyping = true;
      });

      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          _messages.add({
            'text': "Ok, this is accepted",
            'isUser': false,
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

  void _startListening() {
    counter++;
    Fluttertoast.showToast(
      msg: "Microphone tapped, please speak",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 5,
    );
    print("Microphone tapped, please speak. Pressed: $counter times.");
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
            if (_showImage)
              Center(
                child: Image.asset("assets/image/chatbot.jpg", height: 200),
              ),
            SizedBox(height: 20),
            if (_showImage) ...[
              Center(
                child: Column(
                  children: [
                    Text(
                      'Your DocBot',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFEF6D35)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Resolve your queries wherever you are.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'DocBot is always here to help.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
            SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  bool isUserMessage = _messages[index]['isUser'];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
                      children: [
                        if (!isUserMessage) ...[
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xFFEF6D35),
                            child: Icon(
                              Icons.account_circle,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                          SizedBox(width: 8),
                        ],
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE), // Container color
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0),
                              bottomLeft: isUserMessage ? Radius.circular(15.0) : Radius.circular(0),
                              bottomRight: !isUserMessage ? Radius.circular(15.0) : Radius.circular(0),
                            ),
                          ),
                          child: Text(
                            _messages[index]['text'],
                            style: TextStyle(color: Color(0xFF616161)), // Text color
                          ),
                        ),
                        if (isUserMessage) ...[
                          SizedBox(width: 8),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xFFEF6D35),
                            child: Icon(
                              Icons.account_circle,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.mic),
                  onPressed: _startListening,
                  color: Color(0xFFEF6D35),
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter your query here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      fillColor: Color(0xFFEEEEEE), // Text field background color
                      filled: true,
                    ),
                    style: TextStyle(color: Color(0xFF616161)), // Text color for text field
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
*/


/*

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:speech_to_text/speech_to_text.dart';  // Import SpeechToText package

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int counter = 0;
  TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _messages = [];
  bool _showImage = true;
  bool _isTyping = false;

  final SpeechToText _speechToText = SpeechToText();
  bool speechEnabled = false;

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async {
    speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: onSpeechResult);
  }

  void stopListening() async {
    await _speechToText.stop();
  }

  void onSpeechResult(result) {
    setState(() {
      _controller.text = result.recognizedWords;
    });
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty && !_isTyping) {
      setState(() {
        _showImage = false;
        _messages.add({
          'text': _controller.text,
          'isUser': true,
        });
        _controller.clear();
        _isTyping = true;
      });

      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          _messages.add({
            'text': "Ok, this is accepted",
            'isUser': false,
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
            if (_showImage)
              Center(
                child: Image.asset("assets/image/chatbot.jpg", height: 200),
              ),
            SizedBox(height: 20),
            if (_showImage) ...[
              Center(
                child: Column(
                  children: [
                    Text(
                      'Your DocBot',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFEF6D35)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Resolve your queries wherever you are.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'DocBot is always here to help.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
            SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  bool isUserMessage = _messages[index]['isUser'];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
                      children: [
                        if (!isUserMessage) ...[
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xFFEF6D35),
                            child: Icon(
                              Icons.account_circle,
                              color: Colors.white,
                              size: 25,
                            ),
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
                          child: Text(
                            _messages[index]['text'],
                            style: TextStyle(color: Color(0xFF616161)),
                          ),
                        ),
                        if (isUserMessage) ...[
                          SizedBox(width: 8),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xFFEF6D35),
                            child: Icon(
                              Icons.account_circle,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.mic),
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: "Please Speak and keep speaking",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 3,
                    );
                    _speechToText.isListening
                        ? stopListening()
                        : _startListening();
                  },
                  color: Color(0xFFEF6D35),
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter your query here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
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
 */
/*


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _messages = [];
  bool _showImage = true;
  bool _isTyping = false;

  final SpeechToText _speechToText = SpeechToText();
  bool speechEnabled = false;
  bool _isListening = false;
  late DateTime _lastSpeechTime;
  late Timer _timer;

  final Duration _silenceTimeout = Duration(seconds: 6);  // Increased silence timeout

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async {
    speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: onSpeechResult);
    _lastSpeechTime = DateTime.now();
    setState(() {
      _isListening = true;
    });

    // Adjusted to check every 1 second
    _timer = Timer.periodic(Duration(seconds: 1), _checkForSilence);
  }

  void stopListening() async {
    await _speechToText.stop();
    setState(() {
      _isListening = false;
    });

    _timer.cancel();
  }

  void _checkForSilence(Timer timer) {
    if (DateTime.now().difference(_lastSpeechTime) > _silenceTimeout) {
      stopListening();
    }
  }

  void onSpeechResult(result) {
    setState(() {
      _controller.text = result.recognizedWords;
    });

    _lastSpeechTime = DateTime.now();
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty && !_isTyping) {
      setState(() {
        _showImage = false;
        _messages.add({
          'text': _controller.text,
          'isUser': true,
        });
        _controller.clear();
        _isTyping = true;
      });

      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          _messages.add({
            'text': "Ok, this is accepted",
            'isUser': false,
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
    _timer.cancel();
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
            if (_showImage)
              Center(
                child: Image.asset("assets/image/chatbot.jpg", height: 200),
              ),
            SizedBox(height: 20),
            if (_showImage) ...[
              Center(
                child: Column(
                  children: [
                    Text(
                      'Your DocBot',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFEF6D35)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Resolve your queries wherever you are.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'DocBot is always here to help.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
            SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  bool isUserMessage = _messages[index]['isUser'];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
                      children: [
                        if (!isUserMessage) ...[
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xFFEF6D35),
                            child: Icon(
                              Icons.account_circle,
                              color: Colors.white,
                              size: 25,
                            ),
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
                          child: Text(
                            _messages[index]['text'],
                            style: TextStyle(color: Color(0xFF616161)),
                          ),
                        ),
                        if (isUserMessage) ...[
                          SizedBox(width: 8),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xFFEF6D35),
                            child: Icon(
                              Icons.account_circle,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.mic),
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: "Please Speak and keep speaking",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 3,
                    );
                    _speechToText.isListening
                        ? stopListening()
                        : _startListening();
                  },
                  color: _isListening ? Colors.blue : Color(0xFFEF6D35),
                ),
                Expanded(
                  child: TextField(
                    minLines: 1,
                    maxLines: 5,
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter your query here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
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
*/

/*

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Controller for managing the input text field
  TextEditingController _controller = TextEditingController();

  // List to hold chat messages
  List<Map<String, dynamic>> _messages = [];

  // Boolean flag to control showing image on the screen
  bool _showImage = true;

  // Flag to check if the user is typing
  bool _isTyping = false;

  // Initialize the SpeechToText plugin
  final SpeechToText _speechToText = SpeechToText();

  // Flags to check if speech is enabled and if the microphone is listening
  bool speechEnabled = false;
  bool _isListening = false;

  // Variable to store the timestamp of the last speech detected
  late DateTime _lastSpeechTime;

  // Timer to periodically check for silence
  late Timer _timer;

  // Timeout duration to detect silence (6 seconds)
  final Duration _silenceTimeout = Duration(seconds: 6);

  @override
  void initState() {
    super.initState();
    // Initialize speech recognition on app startup
    initSpeech();
  }

  // Initialize speech-to-text and check if the device supports it
  void initSpeech() async {
    speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  // Start listening to speech input
  void _startListening() async {
    // Start listening and set the callback to handle speech results
    await _speechToText.listen(onResult: onSpeechResult);

    // Set the timestamp of the last speech detected
    _lastSpeechTime = DateTime.now();

    setState(() {
      _isListening = true;
    });

    // Start the timer to periodically check for silence
    _timer = Timer.periodic(Duration(seconds: 1), _checkForSilence);
  }

  // Stop listening and cancel the timer
  void stopListening() async {
    await _speechToText.stop();
    setState(() {
      _isListening = false;
    });
    _timer.cancel();
  }

  // Check if silence duration has exceeded the timeout and stop listening if true
  void _checkForSilence(Timer timer) {
    // If silence duration exceeds _silenceTimeout (6 seconds), stop listening
    if (DateTime.now().difference(_lastSpeechTime) > _silenceTimeout) {
      stopListening();
    }
  }

  // Handle speech result and update the input field with recognized text
  void onSpeechResult(result) {
    setState(() {
      _controller.text = result.recognizedWords; // Update the text field with recognized words
    });

    // Update the last speech time whenever new speech is detected
    _lastSpeechTime = DateTime.now();
  }

  // Send the message when the user presses the send button
  void _sendMessage() {
    // If the input text is not empty and the user is not currently typing
    if (_controller.text.isNotEmpty && !_isTyping) {
      setState(() {
        _showImage = false; // Hide the initial chatbot image
        _messages.add({
          'text': _controller.text, // Add user message
          'isUser': true, // Mark the message as from the user
        });
        _controller.clear(); // Clear the text field
        _isTyping = true; // Set the typing flag to true
      });

      // Simulate a chatbot response after 3 seconds
      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          _messages.add({
            'text': "Ok, this is accepted", // Chatbot response
            'isUser': false, // Mark the message as from the bot
          });
          _isTyping = false; // Reset typing flag
        });
      });
    } else {
      // Show a toast if the user tries to send an empty message
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
    // Cancel the timer when disposing of the widget
    _timer.cancel();
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
            // Show image if _showImage is true
            if (_showImage)
              Center(
                child: Image.asset("assets/image/chatbot.jpg", height: 200),
              ),
            SizedBox(height: 20),

            // Show introductory text if _showImage is true
            if (_showImage) ...[
              Center(
                child: Column(
                  children: [
                    Text(
                      'Your DocBot',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFEF6D35)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Resolve your queries wherever you are.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'DocBot is always here to help.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
            SizedBox(height: 40),

            // List of messages in the chat
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length, // Number of messages to display
                itemBuilder: (context, index) {
                  bool isUserMessage = _messages[index]['isUser']; // Check if it's a user message
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
                      children: [
                        if (!isUserMessage) ...[
                          // Avatar for chatbot
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xFFEF6D35),
                            child: Icon(
                              Icons.account_circle,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                          SizedBox(width: 8),
                        ],
                        // Message container
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
                          child: Text(
                            _messages[index]['text'], // Display the message
                            style: TextStyle(color: Color(0xFF616161)),
                          ),
                        ),
                        if (isUserMessage) ...[
                          SizedBox(width: 8),
                          // Avatar for user
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xFFEF6D35),
                            child: Icon(
                              Icons.account_circle,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),

            // Input field and buttons at the bottom
            Row(
              children: [
                // Microphone button to start/stop listening for speech input
                IconButton(
                  icon: Icon(Icons.mic),
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: "Please Speak and keep speaking",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 3,
                    );
                    // Start or stop listening based on the current state
                    _speechToText.isListening
                        ? stopListening()
                        : _startListening();
                  },
                  color: _isListening ? Colors.blue : Color(0xFFEF6D35),
                ),
                Expanded(
                  child: TextField(
                    minLines: 1, // Set the miimum lines on text field to be 1
                    maxLines: 5, // Set the max lines on text field to be 5
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter your query here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      fillColor: Color(0xFFEEEEEE),
                      filled: true,
                    ),
                    style: TextStyle(color: Color(0xFF616161)),
                    onSubmitted: (text) => _sendMessage(), // Send message on "Enter"
                    enabled: !_isTyping, // Disable input while typing
                  ),
                ),

                // Send button to send the message
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
*/
/*
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:response/functionalities/speech.dart';  // Import the speech service

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _messages = [];
  bool _showImage = true;
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

  // Send message when the user presses the send button
  void _sendMessage() {
    if (_controller.text.isNotEmpty && !_isTyping) {
      setState(() {
        _showImage = false;
        _messages.add({
          'text': _controller.text,
          'isUser': true,
        });
        _controller.clear();
        _isTyping = true;
      });

      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          _messages.add({
            'text': "Ok, this is accepted",
            'isUser': false,
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
    _speechService.cancelTimer();  // Cancel the timer if the widget is disposed
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
            if (_showImage) Center(child: Image.asset("assets/image/chatbot.jpg", height: 200)),
            SizedBox(height: 20),
            if (_showImage) ...[
              Center(
                child: Column(
                  children: [
                    Text('Your DocBot', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFEF6D35))),
                    SizedBox(height: 10),
                    Text('Resolve your queries wherever you are.', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 5),
                    Text('DocBot is always here to help.', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ],
            SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  bool isUserMessage = _messages[index]['isUser'];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
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
*/
/*
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:response/functionalities/speech.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/foundation.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _messages = [];
  bool _isTyping = false;
  Uint8List? _imageBytes; // Image bytes (for Web)
  File? _imageFile; // Image file (for Android)

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

  // Function to pick an image
  Future<void> _pickImage() async {
    // Pick a single image file (image only)
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image, // Specify that we want to pick an image
    );

    if (result != null) {
      if (kIsWeb) {
        // For Web, get the bytes of the selected image
        setState(() {
          _imageBytes = result.files.single.bytes;
          _imageFile = null; // Nullify the file (since it's web)
        });
      } else {
        // For Android, get the file path of the selected image
        setState(() {
          _imageFile = File(result.files.single.path!);
          _imageBytes = null; // Nullify the bytes (since it's Android)
        });
      }
    } else {
      // If user cancels the picker, reset both imageBytes and imageFile to null
      setState(() {
        _imageBytes = null;
        _imageFile = null;
      });
    }
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
    } else if (_imageFile != null || _imageBytes != null) {
      // If image is selected, send image as a message
      setState(() {
        _messages.add({
          'image': _imageFile ?? _imageBytes,
          'isUser': true,
          'type': 'image', // Image message type
        });
        _imageFile = null;
        _imageBytes = null;
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
                  } else if (_messages[index]['type'] == 'image') {
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
                            child: _imageFile != null
                                ? Image.file(
                              _imageFile!,
                              width: MediaQuery.of(context).size.width / 2,
                              height: 200,
                              fit: BoxFit.contain,
                            )
                                : Image.memory(
                              _imageBytes!,
                              width: MediaQuery.of(context).size.width / 2,
                              height: 200,
                              fit: BoxFit.contain,
                            ),
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
                IconButton(
                  icon: Icon(Icons.attach_file),
                  onPressed: _pickImage, // Open image picker
                  color: Color(0xFFEF6D35),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/
