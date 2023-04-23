import 'package:flutter/material.dart';
import 'package:lzm_compression_webapp/provider/select_file_provier.dart';
import 'package:lzm_compression_webapp/service/send_file_api.dart';
import 'package:provider/provider.dart';

class CompressBtn extends StatelessWidget {
  const CompressBtn({super.key});

  void onPress(BuildContext context) {
    final SendFileAPI sendFile = SendFileAPI();
    final provider = Provider.of<SelectFileProvider>(context, listen: false);
    sendFile.sendFile(provider.pickedFile!);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPress(context),
      child: Text('Compress'),
    );
  }
}
