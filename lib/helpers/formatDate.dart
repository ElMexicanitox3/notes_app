import 'package:NoteHub/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormatter {

  final BuildContext context;

  DateFormatter({required this.context});
  
  String formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    final timeFormatter = DateFormat('HH:mm');
    final dateFormatter = DateFormat('MMM dd');

    if (date.isAfter(today)) {
      return '${AppLocalizations.of(context).translate('today')} ${timeFormatter.format(date)}';
    } else if (date.isAfter(yesterday)) {
      return '${AppLocalizations.of(context).translate('yesterday')} ${timeFormatter.format(date)}';
    } else {
      return dateFormatter.format(date);
    }
  }

}