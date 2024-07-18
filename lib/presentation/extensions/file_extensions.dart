import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

extension FileExtension on File{
  Future<String> getImageBase64() async {
    Uint8List bytes = await readAsBytes();
    var buffer = bytes.buffer;
    var m = base64.encode(Uint8List.view(buffer));
    return "data:image/png;base64,$m";
  }
}