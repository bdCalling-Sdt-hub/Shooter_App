import 'package:intl/intl.dart';

class BirthdayTimeFormatHelper {
  static String formatDate(DateTime date) {
    return DateFormat('EEEE, MMMM dd, yyyy').format(date);
  }

  static String dataTimeYearFormat(DateTime date) {
    return DateFormat('dd MMM, yyyy').format(date);
  }
}
