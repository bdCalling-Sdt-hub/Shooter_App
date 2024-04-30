import 'package:intl/intl.dart';

class TimeFormatHelper {
  static String formatDate(DateTime date) {
    return DateFormat(' dd MMM, yyyy').format(date);
  }

  static String dateMountFormat(DateTime date) {
    return DateFormat('dd\n MMM ').format(date);
  }

  static String timeFormat(DateTime date) {
    return DateFormat('hh:mm a').format(date);
  }

 static bool isFutureDate(String input) {
    try {
      DateTime date = DateTime.parse(input);
      DateTime now = DateTime.now();
      return date.isAfter(now);
    } catch (e) {
      return false;
    }
  }


}
