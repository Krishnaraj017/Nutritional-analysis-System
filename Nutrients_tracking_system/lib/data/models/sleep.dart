import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';

part 'sleep.freezed.dart';
part 'sleep.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Sleep with _$Sleep {
  factory Sleep({
    @Index(unique: true, replace: true) required DateTime date,
    DateTime? cloudUpdatedAt,
    @JsonKey(includeToJson: false) required DateTime localUpdatedAt,
    SleepLog? sleepLog,
  }) = _Sleep;

  const Sleep._();

  Id get id => date.millisecondsSinceEpoch;

  @ignore
  double get hours {
    if (sleepLog == null) {
      return 0;
    }
    //return upto 2 decimal places
    return double.parse(
      (sleepLog!.sleepDuration.inMinutes / 60).toStringAsFixed(2),
    );
  }

  factory Sleep.fromJson(Map<String, dynamic> json) => _$SleepFromJson(json);

  factory Sleep.fromServer(Map<String, dynamic> json) {
    Map<String, dynamic> plainJson = {};
    plainJson.addAll(json);
    plainJson['localUpdatedAt'] = clock.now().toIso8601String();
    return Sleep.fromJson(plainJson);
  }
}

@freezed
@Embedded(ignore: {'copyWith'})
class SleepLog with _$SleepLog {
  const factory SleepLog({
    /// 24 hour format "HH:mm"
    String? sleepStartTime,

    /// 24 hour format "HH:mm"
    String? sleepEndTime,
    String? remarks,
  }) = _SleepLog;

  const SleepLog._();

  @ignore
  Duration get sleepDuration {
    if (sleepStartTime == null || sleepEndTime == null) {
      return Duration.zero;
    }

    final startTime = DateFormat.Hm().parse(sleepStartTime!);
    final endTime = DateFormat.Hm().parse(sleepEndTime!);
    if (endTime.isBefore(startTime)) {
      return endTime.add(const Duration(days: 1)).difference(startTime);
    }
    return endTime.difference(startTime);
  }

  @ignore
  String get sleepStartTimeString {
    if (sleepStartTime == null) {
      return '--';
    }
    final startTime = DateFormat.Hm().parse(sleepStartTime!);
    return DateFormat.jm().format(startTime);
  }

  @ignore
  String get sleepEndTimeString {
    if (sleepEndTime == null) {
      return '--';
    }
    final endTime = DateFormat.Hm().parse(sleepEndTime!);
    return DateFormat.jm().format(endTime);
  }

  @ignore
  String get sleepDurationInString {
    if (sleepStartTime == null || sleepEndTime == null) {
      return '--';
    }
    return '${sleepDuration.inHours}h ${sleepDuration.inMinutes.remainder(60)}m';
  }

  @ignore
  TimeOfDay? get sleepStartTimeOfDay {
    if (sleepStartTime == null) {
      return null;
    }
    final startTime = DateFormat.Hm().parse(sleepStartTime!);
    return TimeOfDay.fromDateTime(startTime);
  }

  @ignore
  TimeOfDay? get sleepEndTimeOfDay {
    if (sleepEndTime == null) {
      return null;
    }
    final endTime = DateFormat.Hm().parse(sleepEndTime!);
    return TimeOfDay.fromDateTime(endTime);
  }

  factory SleepLog.fromJson(Map<String, dynamic> json) =>
      _$SleepLogFromJson(json);
}
