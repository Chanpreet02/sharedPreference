import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

class MessageScreen extends StatefulWidget {
  @override
   MessageScreenState createState() =>  MessageScreenState();
}

class MessageScreenState extends State<MessageScreen> {
  TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _messages = [];
  bool _isTyping = false;
  Uint8List? _imageBytes; // For Web image bytes
  File? _imageFile; // For Android/iOS image file

  // Function to pick an image (both Web and Mobile)
  // Future<void> _pickImage() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.image, // Specify that we want to pick an image
  //   );
  //
  //   if (result != null) {
  //     if (kIsWeb) {
  //       // For Web, get the bytes of the selected image
  //       setState(() {
  //         _imageBytes = result.files.single.bytes;
  //         _imageFile = null; // Nullify the file for Web
  //       });
  //     } else {
  //       // For Mobile, get the file path of the selected image
  //       setState(() {
  //         _imageFile = File(result.files.single.path!);
  //         _imageBytes = null; // Nullify the bytes for Mobile
  //       });
  //     }
  //   } else {
  //     // If user cancels the picker, reset both imageBytes and imageFile to null
  //     setState(() {
  //       _imageBytes = null;
  //       _imageFile = null;
  //     });
  //   }
  // }

  // Send the message (text or image)
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

      Future.delayed(Duration(seconds: 2), () {
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
      // Show toast if no message or image is selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a message or select an image")),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat App", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Messages List
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
                              backgroundColor: Colors.green,
                              child: Icon(Icons.account_circle, color: Colors.white, size: 25),
                            ),
                            SizedBox(width: 8),
                          ],
                          Container(
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
                              backgroundColor: Colors.green,
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
                              backgroundColor: Colors.green,
                              child: Icon(Icons.account_circle, color: Colors.white, size: 25),
                            ),
                            SizedBox(width: 8),
                          ],
                          Container(
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
                              backgroundColor: Colors.green,
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
                // IconButton(
                //   icon: Icon(Icons.attach_file),
                //   onPressed: _pickImage, // Open image picker
                //   color: Colors.green,
                // ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                      filled: true,
                      fillColor: Color(0xFFEEEEEE),
                    ),
                    style: TextStyle(color: Color(0xFF616161)),
                    onSubmitted: (text) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                  color: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
