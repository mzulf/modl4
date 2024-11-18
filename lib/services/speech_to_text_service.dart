import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextService {
  final SpeechToText _speechToText = SpeechToText();

  Future<bool> initialize() async {
    try {
      return await _speechToText.initialize();
    } catch (e) {
      print("Error initializing SpeechToText: $e");
      return false;
    }
  }

  void startListening({required Function(String) onResult}) {
    _speechToText.listen(onResult: (result) {
      onResult(result.recognizedWords);
    });
  }

  void stopListening() {
    _speechToText.stop();
  }

  bool isListening() {
    return _speechToText.isListening;
  }
}
