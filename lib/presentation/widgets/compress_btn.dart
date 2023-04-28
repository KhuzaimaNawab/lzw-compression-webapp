import 'package:flutter/material.dart';
import 'package:lzm_compression_webapp/provider/select_file_provider.dart';
import 'package:lzm_compression_webapp/service/compress_file_api.dart';
import 'package:provider/provider.dart';

class CompressBtn extends StatelessWidget {
  const CompressBtn({super.key});

  void onPress(BuildContext context) {
    final CompressFileAPI sendFile = CompressFileAPI();
    final provider = Provider.of<SelectFileProvider>(context, listen: false);
    sendFile.compress(provider.pickedFile!);
}

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPress(context),
      child: const Text('Compress'),
    );
  }
}
