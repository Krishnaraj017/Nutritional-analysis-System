import 'package:clock/clock.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get shortDateName {
    switch (weekday) {
      case DateTime.monday:
        return 'M';
      case DateTime.tuesday:
        return 'T';
      case DateTime.wednesday:
        return 'W';
      case DateTime.thursday:
        return 'Th';
      case DateTime.friday:
        return 'F';
      case DateTime.saturday:
        return 'Sa';
      case DateTime.sunday:
        return 'S';
      default:
        return '';
    }
  }

  String get relativeDateName {
    DateTime currentDate = clock.now();
    final date = this;
    if (date.year == currentDate.year &&
        date.month == currentDate.month &&
        date.day == currentDate.day) {
      return 'Today';
    } else if (date.year == currentDate.year &&
        date.month == currentDate.month &&
        date.day == currentDate.day - 1) {
      return 'Yesterday';
    } else if (date.year == currentDate.year &&
        date.month == currentDate.month &&
        date.day == currentDate.day + 1) {
      return 'Tomorrow';
    } else {
      return DateFormat.E().format(date); // Weekday name
    }
  }
}
