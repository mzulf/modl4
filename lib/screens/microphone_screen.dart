import 'package:flutter/material.dart';
import '../controllers/microphone_controller.dart';
import '../widgets/sensor_button.dart';
import 'package:get/get.dart';

class MicrophoneScreen extends StatelessWidget {
  final microphoneController = Get.put(MicrophoneController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Rekam Resep",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SensorButton(
              icon: Icons.mic,
              label: "Mulai Merekam",
              onPressed: () => microphoneController.startListening(),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'Rekam suara untuk mencatat resep masakan Anda',
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