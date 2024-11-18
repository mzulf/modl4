import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CameraController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  var imagePath = ''.obs;
  var imageBytes = Rx<Uint8List?>(null);
  var isLoading = false.obs;

  Future<void> pickImage() async {
    try {
      isLoading.value = true;
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80, // Optimize image quality
      );

      if (image != null) {
        imageBytes.value = await image.readAsBytes();
        imagePath.value = image.path;

        Get.snackbar(
          'Berhasil',
          'Gambar berhasil dipilih',
          backgroundColor: Colors.green[400],
          colorText: Colors.white,
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(16),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal memilih gambar: ${e.toString()}',
        backgroundColor: Colors.red[400],
        colorText: Colors.white,
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(16),
      );
      print('Error picking image: $e');
    } finally {
      isLoading.value = false;
    }
  }
}