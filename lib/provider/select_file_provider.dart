import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SelectFileProvider with ChangeNotifier {
  String? _fileName;
  PlatformFile? _pickedFile;

  String? get fileName => _fileName;


  void setFileName(String name) {
    _fileName = name;
    notifyListeners();
  }

  PlatformFile? get pickedFile => _pickedFile;

  void setPlatFormFile(PlatformFile file) {
    _pickedFile = file;
    notifyListeners();
  }
}


