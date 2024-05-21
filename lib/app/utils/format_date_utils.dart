import 'package:intl/intl.dart';

class MyFormatDateUtils {
  MyFormatDateUtils();

  static String time({
    DateTime? time,
  }) {
    return DateFormat().add_jm().format(time ?? DateTime.now());
  }

  static String timeHHmm({
    DateTime? time,
  }) {
    return DateFormat('HH:mm').format(time ?? DateTime.now());
  }

  static String dateEEddMMMyyyy({
    DateTime? date,
  }) {
    return DateFormat('EE, dd MMM yyyy').format(date ?? DateTime.now());
  }

  static String dateEEEEddMMMMyyyy({
    DateTime? date,
  }) {
    return DateFormat('EEEE, dd MMMM yyyy').format(date ?? DateTime.now());
  }
}
