

import 'package:monie_point/presentation/extensions/string_extensions.dart';

class DateTimeManager {

  String sortDatesByDifference(String date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final givenDate = date.parseDateTime;

    if (givenDate.day == today.day &&
        givenDate.month == today.month &&
        givenDate.year == today.year) {
      return "today";
    } else if (givenDate.day == yesterday.day &&
        givenDate.month == yesterday.month &&
        givenDate.year == yesterday.year) {
      return "yesterday";
    } else {
      return convertToFormattedDate(date);
    }
  }

  String convertToFormattedDate(String dateTimeString) {
    List<String> parts =
    dateTimeString.split(' '); // Split at the space character
    if (parts.isNotEmpty && parts[0].contains('.')) {
      return parts[0];
    } else {
      return "Invalid format";
    }
  }
}