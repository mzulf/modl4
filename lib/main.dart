import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modl4/screens/home_screen.dart';
import 'screens/camera_screen.dart';
import 'screens/microphone_screen.dart';
import 'screens/speaker_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/camera', page: () => CameraScreen()),
        GetPage(name: '/microphone', page: () => MicrophoneScreen()),
        GetPage(name: '/speaker', page: () => SpeakerScreen()),
      ],
    );
  }
}
