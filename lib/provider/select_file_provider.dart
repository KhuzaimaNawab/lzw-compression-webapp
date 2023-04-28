import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SelectFileProvider with ChangeNotifier {
  String? _compressedFileName;
  String? _decompressedFileName;
  PlatformFile? _compressedFile;
  PlatformFile? _decompressedFile;

  String? get compressedFileName => _compressedFileName;

  void setCompressedFileName(String name) {
    _compressedFileName = name;
    notifyListeners();
  }

  String? get decompressedFileName => _decompressedFileName;

  void setDecompressedFileName(String name) {
    _decompressedFileName = name;
    notifyListeners();
  }

  PlatformFile? get compressedFile => _compressedFile;

  void setCompressedFile(PlatformFile file) {
    _compressedFile = file;
    notifyListeners();
  }

  PlatformFile? get decompressedFile => _decompressedFile;

  void setDecompressedFile(PlatformFile file) {
    _decompressedFile = file;
    notifyListeners();
  }
}
