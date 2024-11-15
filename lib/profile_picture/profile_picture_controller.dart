import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePictureController extends GetxController {
  XFile? imageFile;
  Future<void> getImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      imageFile = pickedFile;
      update();
    }
  }

}