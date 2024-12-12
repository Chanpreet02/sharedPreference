// speech_service.dart
import 'dart:async';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SpeechService {
  final SpeechToText _speechToText = SpeechToText();
  bool speechEnabled = false;
  bool isListening = false;
  late DateTime lastSpeechTime;
  late Timer _timer;
  final Duration silenceTimeout = Duration(seconds: 6);

  // Initialize the speech-to-text plugin
  Future<void> initSpeech() async {
    speechEnabled = await _speechToText.initialize();
  }

  // Start listening to speech input
  Future<void> startListening(Function onResult) async {
    await _speechToText.listen(onResult: (result) => onResult(result));
    lastSpeechTime = DateTime.now();
    isListening = true;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      checkForSilence();
    });
  }

  // Stop listening and cancel the timer
  Future<void> stopListening() async {
    await _speechToText.stop();
    isListening = false;
    _timer.cancel();  // Cancel the timer when stopping
  }

  // Check for silence and stop listening if exceeded
  void checkForSilence() {
    if (DateTime.now().difference(lastSpeechTime) > silenceTimeout) {
      stopListening();
    }
  }

  // Public method to cancel the timer
  void cancelTimer() {
    _timer.cancel();
  }
}
