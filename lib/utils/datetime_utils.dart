import 'package:intl/intl.dart';

class DateTimeUtils {
  static String getTime(DateTime? date) {
    if (date == null) {
      return '';
    }
    final String hour = date.hour < 10 ? '0${date.hour}' : '${date.hour}';
    final String minute =
        date.minute < 10 ? '0${date.minute}' : '${date.minute}';
    return '$hour.$minute';
  }

  static String getDateTime(DateTime? date) {
    if (date == null) {
      return '';
    }
    final formatter = DateFormat('dd MMMM yyyy HH:mm');
    return formatter.format(date);
  }

  static String getDateTimeWithDayName(DateTime? date) {
    if (date == null) {
      return '';
    }
    final formatter = DateFormat('EEEE, dd MMMM yyyy');
    return formatter.format(date);
  }
}
