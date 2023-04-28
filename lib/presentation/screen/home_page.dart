import "package:flutter/material.dart";
import 'package:lzm_compression_webapp/presentation/widgets/select_file_compress_btn.dart';
import 'package:lzm_compression_webapp/provider/select_file_provider.dart';
import "package:provider/provider.dart";

import "../widgets/compress_btn.dart";
import "../widgets/decompress_btn.dart";
import "../widgets/select_file_decompress_btn.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const subTitleStype = TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 18,
    );

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(left: size.width * 0.30, right: size.width * 0.30),
        child: SizedBox(
          width: size.width,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/logo.png', width: 70, height: 70),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'LZW Data Compression',
                    style: TextStyle(fontSize: 30, fontFamily: 'Sigmar'),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              RichText(
                text: TextSpan(
                  text: 'This ',
                  style: subTitleStype,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Online Text Compresser ',
                      style: subTitleStype.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text:
                          "compresses text. This is loseless compression meaning your data will not be lost. Your file will be shrinked as low as possible. The compressed file will be unuseable until it's decompressed. Your File extension will be ",
                      style: subTitleStype,
                    ),
                    TextSpan(
                      text: ".lzw. ",
                      style: subTitleStype.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text:
                          "You can decompress your file on this website only.",
                      style: subTitleStype,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "NOTE: PLEASE UPLOAD A FILE THAT HAVE ATLEAST 2-3 PARAGRAPH OTHERWISE THE COMPRESSION WILL NOT WORK.",
                style: subTitleStype.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Select a file to compress (The file should be in .txt extension)',
                style: subTitleStype,
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectFileCompressBtn(
                    extension: 'txt',
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const CompressBtn(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<SelectFileProvider>(
                builder: (context, value, _) {
                  return Visibility(
                    visible: value.compressedFileName != null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Your File Name is: ',
                          style: subTitleStype,
                        ),
                        Text(
                          value.compressedFileName ?? '',
                          style: subTitleStype.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 60),
              const Text(
                'Select a file to decompress (The file should be in .lzw extension)',
                style: subTitleStype,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectFileDecompressBtn(
                    extension: 'lzw',
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const DecompressBtn(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<SelectFileProvider>(
                builder: (context, value, _) {
                  return Visibility(
                    visible: value.decompressedFileName != null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Your File Name is: ',
                          style: subTitleStype,
                        ),
                        Text(
                          value.decompressedFileName ?? '',
                          style: subTitleStype.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
