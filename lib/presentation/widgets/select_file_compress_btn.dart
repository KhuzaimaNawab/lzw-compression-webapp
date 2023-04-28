import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/select_file_provider.dart';

class SelectFileCompressBtn extends StatelessWidget {
  SelectFileCompressBtn({super.key, required this.extension});

  String? _fileName;
  String extension;

  void onPress(BuildContext context) async {
    final provider = Provider.of<SelectFileProvider>(context, listen: false);
    PlatformFile pickedFile;
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: [extension]);
    if (result != null) {
      _fileName = result.files.first.name;
      pickedFile = result.files.first;
      provider.setCompressedFile(pickedFile);
    }
    provider.setCompressedFileName(_fileName!);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: () => onPress(context),
      child: SizedBox(
        height: 40,
        width: 130,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.upload),
            Text(
              'UPLOAD FILE',
            )
          ],
        ),
      ),
    );
  }
}
