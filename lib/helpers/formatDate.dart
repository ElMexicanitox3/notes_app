import 'package:intl/intl.dart';

class DateFormatter {

  static String formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    final timeFormatter = DateFormat('HH:mm');
    final dateFormatter = DateFormat('MMM dd');

    if (date.isAfter(today)) {
      return 'today ${timeFormatter.format(date)}';
    } else if (date.isAfter(yesterday)) {
      return 'yesterday ${timeFormatter.format(date)}';
    } else {
      return dateFormatter.format(date);
    }
  }

}