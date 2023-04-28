import 'package:flutter/material.dart';
import 'package:lzm_compression_webapp/provider/select_file_provider.dart';
import 'package:lzm_compression_webapp/service/compress_file_api.dart';
import 'package:provider/provider.dart';

class CompressBtn extends StatelessWidget {
  const CompressBtn({super.key});

  void onPress(BuildContext context) {
    final CompressFileAPI sendFile = CompressFileAPI();
    final provider = Provider.of<SelectFileProvider>(context, listen: false);
    sendFile.compress(provider.compressedFile!);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: Colors.grey,
      ),
      onPressed: () => onPress(context),
      child: SizedBox(
        height: 40,
        width: 130,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.compress),
            SizedBox(
              width: 5,
            ),
            Text(
              'COMPRESS',
            )
          ],
        ),
      ),
    );
  }
}
