import 'package:intl/intl.dart';

class TimeFormatHelper{

  static   String formatDate(DateTime date) {
    return DateFormat(' dd MMM, yyyy').format(date);
  }


  static   String dateMountFormat(DateTime date) {
    return DateFormat('dd\n MMM ').format(date);
  }
}