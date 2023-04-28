import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class DecompressFileAPI {
  void decompress(PlatformFile file) async {
    final url = Uri.parse('http://localhost:3000/decompress');
    final bytes = file.bytes!;
    final uint8List = Uint8List.fromList(bytes);
    final request = http.MultipartRequest('POST', url);
    final multiPartFile = http.MultipartFile.fromBytes(
      'file',
      uint8List,
      filename: file.name,
    );
    request.files.add(multiPartFile);
    final response = await http.Response.fromStream(await request.send());
    final responseBody = json.decode(response.body);
    String downloadURL = responseBody['compressedFileLink'];
    final uri = Uri.parse(downloadURL);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw "Could not launch $uri";
    }
    if (response.statusCode == 200) {
      print('File send sucessfully');
    }
  }
}
