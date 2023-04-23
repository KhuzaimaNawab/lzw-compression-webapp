import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/select_file_provier.dart';

class SelectFileBtn extends StatefulWidget {
  const SelectFileBtn({super.key});

  @override
  State<SelectFileBtn> createState() => _SelectFileBtnState();
}

class _SelectFileBtnState extends State<SelectFileBtn> {
  String? _fileName;

  void onPress(BuildContext context) async {
    final provider = Provider.of<SelectFileProvider>(context, listen: false);
    PlatformFile pickedFile;
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['txt']);
    if (result != null) {
      _fileName = result.files.first.name;
      pickedFile = result.files.first;
      provider.setPlatFormFile(pickedFile);
    }
    provider.setFileName(_fileName!);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPress(context),
      child: const Text('Select a file'),
    );
  }
}
