import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpeakerController extends GetxController {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final Rx<PlayerState> _audioState = PlayerState.stopped.obs;

  Rx<PlayerState> get audioState => _audioState;

  void playSound(String audioPath) async {
    try {
      await _audioPlayer.play(AssetSource(audioPath));
      _audioState.value = PlayerState.playing;
    } catch (e) {
      print('Error playing audio: $e');
      Get.snackbar(
        'Error',
        'Gagal memainkan audio',
        backgroundColor: Colors.red[400],
        colorText: Colors.white,
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(16),
      );
    }
  }

  void pauseSound() async {
    try {
      await _audioPlayer.pause();
      _audioState.value = PlayerState.paused;
    } catch (e) {
      print('Error pausing audio: $e');
    }
  }

  void stopSound() async {
    try {
      await _audioPlayer.stop();
      _audioState.value = PlayerState.stopped;
    } catch (e) {
      print('Error stopping audio: $e');
    }
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }
}