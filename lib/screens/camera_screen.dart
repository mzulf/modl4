import 'package:flutter/material.dart';
import '../controllers/camera_controller.dart';
import '../widgets/sensor_button.dart';
import 'package:get/get.dart';

class CameraScreen extends StatelessWidget {
  final cameraController = Get.put(CameraController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Scan Bahan Makanan",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),

            // Image Preview
            Obx(() => Container(
              margin: EdgeInsets.all(16),
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(
                  color: cameraController.imageBytes.value != null
                      ? Colors.orange
                      : Colors.grey[300]!,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: cameraController.imageBytes.value != null
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.memory(
                  cameraController.imageBytes.value!,
                  fit: BoxFit.cover,
                ),
              )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image_outlined,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Preview gambar akan muncul di sini',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Format yang didukung: JPG, PNG',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )),

            SizedBox(height: 20),

            // Upload Button
            Obx(() => cameraController.isLoading.value
                ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
            )
                : SensorButton(
              icon: Icons.camera_alt,
              label: "Pilih Foto Bahan",
              onPressed: () => cameraController.pickImage(),
            ),
            ),

            SizedBox(height: 20),

            // Instructions
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  Text(
                    'Pindai bahan makanan untuk melihat resep yang bisa dibuat',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Pastikan gambar bahan makanan terlihat jelas dan tidak blur',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // File info (optional)
            Obx(() => cameraController.imagePath.value.isNotEmpty
                ? Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'File: ${cameraController.imagePath.value.split('/').last}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            )
                : SizedBox()),
          ],
        ),
      ),
    );
  }
}