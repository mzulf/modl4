import 'package:flutter/material.dart';
import '../controllers/speaker_controller.dart';
import '../widgets/sensor_button.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

class SpeakerScreen extends StatelessWidget {
  final SpeakerController speakerController = Get.put(SpeakerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Dengar Resep",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => speakerController.audioState.value == PlayerState.playing
                    ? SensorButton(
                  icon: Icons.pause,
                  label: "Pause",
                  onPressed: () => speakerController.pauseSound(),
                )
                    : SensorButton(
                  icon: Icons.play_arrow,
                  label: "Play",
                  onPressed: () =>
                      speakerController.playSound('audio/tutormasak.mp3'),
                )),
                SizedBox(width: 16),
                SensorButton(
                  icon: Icons.stop,
                  label: "Stop",
                  onPressed: () => speakerController.stopSound(),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'Dengarkan panduan memasak langkah demi langkah',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}