import "package:flutter/material.dart";
import "package:lzm_compression_webapp/presentation/widgets/selectFile_btn.dart";
import "package:lzm_compression_webapp/provider/select_file_provier.dart";
import "package:provider/provider.dart";

import "../widgets/compress_btn.dart";

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
              'Mana Kardia',
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Check kar Ya',
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
            const SelectFileBtn(),
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
          ],
        ),
      ),
    );
  }
}
