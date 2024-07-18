import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringExtensions on String {
  static const String baseString = "assets/";

  AssetImage get pngAssets => AssetImage("assets/images/png/$this.png");

  String get toSvgPath {
    return "assets/svg/$this.svg";
  }

  DateTime get parseDateTime{
    final dateFormat = DateFormat('dd.MM.yyyy HH:mm');
    try {
      return dateFormat.parse(this);
    } catch (e) {
      print("Error parsing date: $e");
      return DateTime.now();
    }
  }
}
