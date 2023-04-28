import "package:flutter/material.dart";
import 'package:lzm_compression_webapp/provider/select_file_provider.dart';
import 'package:provider/provider.dart';

import 'presentation/screen/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SelectFileProvider(),
      child: const MaterialApp(
        title: 'LZW Compression',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
