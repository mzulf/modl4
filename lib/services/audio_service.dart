import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> playSound(String filePath) async {
    try {
      await _audioPlayer.play(DeviceFileSource(filePath));
    } catch (e) {
      print("Error playing sound: $e");
    }
  }

  Future<void> stopSound() async {
    try {
      await _audioPlayer.stop();
    } catch (e) {
      print("Error stopping sound: $e");
    }
  }

  Future<void> pauseSound() async {
    try {
      await _audioPlayer.pause();
    } catch (e) {
      print("Error pausing sound: $e");
    }
  }
}
