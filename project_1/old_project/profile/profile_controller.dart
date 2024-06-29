import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends ChangeNotifier {
  File myImage = File('');

  Future<File> selectImage() async {
    ImagePicker picker = ImagePicker();

    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      myImage = File(image.path);
    }

    notifyListeners();
    return myImage;
  }

  void removeImage() {
    myImage = File('');
    notifyListeners();
  }
}
