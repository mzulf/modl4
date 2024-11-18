import 'package:get/get.dart';
import '../services/speech_to_text_service.dart';

class MicrophoneController extends GetxController {
  final SpeechToTextService _speechToTextService = SpeechToTextService();
  RxBool isListening = false.obs;
  RxString recognizedWords = ''.obs;

  Future<void> startListening() async {
    bool available = await _speechToTextService.initialize();
    if (available) {
      isListening.value = true;
      _speechToTextService.startListening(onResult: (words) {
        recognizedWords.value = words;
      });
    }
  }

  void stopListening() {
    isListening.value = false;
    _speechToTextService.stopListening();
  }
}
