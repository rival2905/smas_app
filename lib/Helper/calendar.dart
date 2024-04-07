import 'package:intl/intl.dart';

abstract class CalendarUtils {
  static const String YEAR_MONTH_DATE_HOUR_MINUTE_SECOND = "yyyy-MM-dd_hh:mm:ss";

  static String parseDate(DateTime date, {String pattern = 'yyyy-MM-dd'}) {
    return DateFormat(pattern).format(date);
  }

  static DateTime parseStringDate(String date,
      {String pattern = 'yyyy-MM-dd'}) {
    return DateFormat(pattern).parse(date);
  }
  static String parseDate1(DateTime date) {
    final result = DateFormat.yMMMMd().format(date);
    final List<String> dateParts = result.split(' ');
    final day = dateParts[1];
    final month = DateFormat.MMMM().format(date);
    final year = dateParts[2];
    return result;
  }
}