import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditPageProvider extends ChangeNotifier {
  String? profilepath;
  XFile? image;

  void setImage(XFile? img) {
    image = img;
    profilepath = img?.path;
    notifyListeners();
  }

  void clearImage() {
    image = null;
    profilepath = null;
    notifyListeners();
  }
}
