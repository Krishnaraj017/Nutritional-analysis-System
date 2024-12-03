import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:statedemo/domain/entities/enums.dart';

class AppUtils {
  AppUtils._();

  static TimeOfDayEnum getTimeOfDay() {
    DateTime now = clock.now();
    int currentHour = now.hour;
    if (currentHour >= 0 && currentHour <= 11) {
      return TimeOfDayEnum.morning;
    }
    if (currentHour >= 11 && currentHour <= 16) {
      return TimeOfDayEnum.afternoon;
    }
    if (currentHour >= 16 && currentHour <= 20) {
      return TimeOfDayEnum.evening;
    }
    return TimeOfDayEnum.night;
  }

  /// get DateTime with year, month, day, hour, minute, seconds and millisecondsvalues
  static DateTime getDateAndTime({required DateTime time}) {
    // dateTime.now.seconds and millisecond is so that if the use tries to add two reminders on same time it must not get overriden(the seconds will be different)
    return DateTime(
      time.year,
      time.month,
      time.day,
      time.hour,
      time.minute,
      clock.now().second,
      clock.now().millisecond,
    );
  }

  static String getTimeFromTimeOfDay({
    bool is24HourFormat = false,
    required TimeOfDay timeOfDay,
  }) {
    String hour = timeOfDay.hour.toString().padLeft(2, '0');
    String minute = timeOfDay.minute.toString().padLeft(2, '0');

    if (is24HourFormat) {
      return '$hour:$minute';
    }
    hour = int.parse(hour) > 12
        ? (int.parse(hour) - 12).toString().padLeft(2, '0')
        : hour;

    return timeOfDay.period == DayPeriod.am
        ? "$hour:$minute AM"
        : "$hour:$minute PM";
  }
}
