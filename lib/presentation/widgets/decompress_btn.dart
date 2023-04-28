import 'package:flutter/material.dart';
import 'package:lzm_compression_webapp/provider/select_file_provider.dart';
import 'package:lzm_compression_webapp/service/decompress_file_api.dart';
import 'package:provider/provider.dart';

class DecompressBtn extends StatelessWidget {
  const DecompressBtn({super.key});

  void onPress(BuildContext context) {
    DecompressFileAPI decompress = DecompressFileAPI();
    final provider = Provider.of<SelectFileProvider>(context, listen: false);
    decompress.decompress(provider.decompressedFile!);
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
            Icon(Icons.unarchive),
            SizedBox(
              width: 5,
            ),
            Text(
              'DECOMPRESS',
            )
          ],
        ),
      ),
    );
  }
}
