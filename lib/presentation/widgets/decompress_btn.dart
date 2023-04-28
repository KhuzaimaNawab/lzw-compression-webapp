import 'package:flutter/material.dart';
import 'package:lzm_compression_webapp/provider/select_file_provider.dart';
import 'package:lzm_compression_webapp/service/decompress_file_api.dart';
import 'package:provider/provider.dart';

class DecompressBtn extends StatelessWidget {
  const DecompressBtn({super.key});

  void onPress(BuildContext context) {
    DecompressFileAPI decompress = DecompressFileAPI();
    final provider = Provider.of<SelectFileProvider>(context, listen: false);
    decompress.decompress(provider.pickedFile!);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPress(context),
      child: const Text('Decompress'),
    );
  }
}
