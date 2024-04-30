import 'package:intl/intl.dart';

class BirthdayTimeFormatHelper {
  static String formatDate(DateTime date) {
    return DateFormat('EEEE MMM-dd-yyyy').format(date);
  }

  static String dataTimeYearFromat(DateTime date) {
    return DateFormat('dd MMM, yyyy').format(date);
  }
}
