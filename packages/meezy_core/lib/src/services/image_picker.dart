import 'dart:io';

import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart' as image_picker;

class AppImagePicker {
  final _picker = image_picker.ImagePicker();

  Future<File?> pickImage() async {
    final result = await _picker.pickImage(source: image_picker.ImageSource.gallery);

    return result != null ? File(result.path) : null;
  }

  Future<List<XFile?>> pickMultipleImages(int limit) async {
    final result = await _picker.pickMultiImage(limit: limit);
    return result;
  }
}
