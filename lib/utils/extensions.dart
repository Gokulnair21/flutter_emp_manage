import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension DateTimeExtension on DateTime {
  String getEntireMonth() {
    switch (month) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
      default:
        return "Invalid";
    }
  }

  String formatDate([String format = 'd MMM y']) {
    final DateFormat formatter = DateFormat(format);
    return formatter.format(this);
  }

  DateTime addMonths(int monthsToAdd) {
    int newYear = year;
    int newMonth = month + monthsToAdd;
    while (newMonth > 12) {
      newMonth -= 12;
      newYear++;
    }
    return DateTime(
        newYear, newMonth, day, hour, minute, second, millisecond, microsecond);
  }

  DateTime findNextWeekDay(int currentWeek) {
    int difference = currentWeek - weekday;
    int daysToAdd = difference >= 0 ? difference : (7 + difference);
    DateTime nextMonday = add(Duration(days: daysToAdd));
    return nextMonday;
  }
}

extension ListForIndexedExtension<T> on List<T> {
  void forIndexed(void Function(int index, T element) action) {
    for (int i = 0; i < length; i++) {
      action(i, this[i]);
    }
  }
}

extension BuildContextExt on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this)!;
}
