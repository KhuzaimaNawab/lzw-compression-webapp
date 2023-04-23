import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class SendFileAPI {
  void sendFile(PlatformFile file) async {
    final url = Uri.parse('http://localhost:3000/compress');
    final bytes = file.bytes;
    final request = http.MultipartRequest('POST', url);
    final multipartFile = http.MultipartFile.fromBytes(
      'file',
      bytes as List<int>,
      filename: file.name,
    );
    request.files.add(multipartFile);
    final response = await http.Response.fromStream(await request.send());
    final responseBody = json.decode(response.body);
    print(responseBody['compressedFileLink']);
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
