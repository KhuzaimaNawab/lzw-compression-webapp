import "package:flutter/material.dart";
import "package:lzm_compression_webapp/presentation/widgets/selectFile_btn.dart";
import 'package:lzm_compression_webapp/provider/select_file_provider.dart';
import "package:provider/provider.dart";

import "../widgets/compress_btn.dart";
import "../widgets/decompress_btn.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'LZW Data Compression',
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'LZW is a loseless data compresssion',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
                'Select a file to compress (The file should be in .txt extension)'),
            const SizedBox(
              height: 10,
            ),
            SelectFileBtn(
              extension: 'txt',
            ),
            Consumer<SelectFileProvider>(
              builder: (context, value, _) {
                return Visibility(
                  visible: value.fileName != null,
                  child: Text(
                    value.fileName ?? '',
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const CompressBtn(),
            const SizedBox(height: 60),
            const Text(
                'Select a file to decompress (The file should be in .lzw extension)'),
            const SizedBox(
              height: 20,
            ),
            SelectFileBtn(
              extension: 'lzw',
            ),
            const SizedBox(
              height: 20,
            ),
            const DecompressBtn(),
          ],
        ),
      ),
    );
  }
}
