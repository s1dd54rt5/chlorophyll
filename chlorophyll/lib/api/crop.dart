import 'package:path/path.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> uploadImage(File imageFile) async {
  var stream = new http.ByteStream(imageFile.openRead());
  stream.cast();
  var length = await imageFile.length();
  var uri = Uri.parse("http://598a22e730e8.ngrok.io/upload");
  var request = new http.MultipartRequest('POST', uri);
  var multiPartFile = new http.MultipartFile(
    'file',
    stream,
    length,
    filename: basename(imageFile.path),
  );
  request.files.add(multiPartFile);
  var response = await request.send();
  print(response.statusCode);
  final respStr = await response.stream.bytesToString();
  print(respStr);
}
