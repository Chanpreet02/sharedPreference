import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final SpeechToText _speechToText = SpeechToText();
  bool speechEnabled = false;
  String wordsSpoken = "";

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async{
    speechEnabled = await _speechToText.initialize();
    setState(() {

    });
  }
  void _startListening() async{
    await _speechToText.listen(onResult: onSpeechResult);
  }

  void stopListening() async{
    await _speechToText.stop();
  }

  void onSpeechResult(result){
    setState(() {
      wordsSpoken = "${result.recognizedWords}";
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20,),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Text(_speechToText.isListening
                    ?"Listening...."
                    : speechEnabled
                    ? "Tap the microphone to start speaking"
                    : "Speech Not Available",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              _speechToText.isListening
                  ? stopListening()
                  : _startListening();
            },
            icon: Icon(
              _speechToText.isNotListening
                  ? Icons.mic_off
                  : Icons.mic,
              color: Colors.blue,
              size: 30.0,
            ),
          ),
          
          Expanded(child: Text(wordsSpoken),)
        ],
      ),
    );
  }
}
