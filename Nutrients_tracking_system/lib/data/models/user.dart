import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:statedemo/data/constants/hive_constants.dart';
import 'package:statedemo/domain/entities/enums.dart';

part 'user.freezed.dart';
part 'user.g.dart';

//  final String? name;
//   final DateTime? dateOfBirth;
//   final Gender? gender;
//   final double? weight;
//   final double? height;
//   @JsonKey(fromJson: _timeOfDayFromString, toJson: _timeOfDayToString)
//   final TimeOfDay? wakeUpTime;
//   @JsonKey(fromJson: _timeOfDayFromString, toJson: _timeOfDayToString)
//   final TimeOfDay? bedTime;

@Freezed()
@HiveType(typeId: HiveConstants.userType)
class User with _$User {
  const User._();

  const factory User({
    @HiveField(0) String? name,
    @JsonKey(fromJson: _dateTimeFromString, toJson: _dateTimeToString)
    @HiveField(1)
    DateTime? dateOfBirth,
    @HiveField(2) Gender? gender,
    @HiveField(3) double? weight,
    @HiveField(4) double? height,
    @HiveField(5)
    @Default(TimeOfDay(hour: 7, minute: 0))
    @JsonKey(fromJson: _timeOfDayFromString, toJson: _timeOfDayToString)
    TimeOfDay wakeUpTime,
    @HiveField(6)
    @Default(TimeOfDay(hour: 22, minute: 0))
    @JsonKey(fromJson: _timeOfDayFromString, toJson: _timeOfDayToString)
    TimeOfDay bedTime,
    @JsonKey(name: 'isonboardingdone', includeToJson: false)
    @HiveField(7)
    @Default(false)
    bool isOnboardingCompleted,
    @JsonKey(includeToJson: false, includeFromJson: false)
    @HiveField(8, defaultValue: null)
    DateTime? lastSyncedAt,
    @Default(false)
    @JsonKey(includeToJson: false, includeFromJson: false)
    @HiveField(9, defaultValue: false)
    bool last7daysSynced,
  }) = _User;

  String get dateOfBirthString =>
      dateOfBirth == null ? '-' : DateFormat('dd/MM/yyyy').format(dateOfBirth!);

  String? get dateOfBirthFormatted => dateOfBirth == null
      ? null
      : DateFormat('dd/MM/yyyy').format(dateOfBirth!);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

TimeOfDay _timeOfDayFromString(String time) {
  final parts = time.split(':');
  return TimeOfDay(
    hour: int.parse(parts[0]),
    minute: int.parse(parts[1]),
  );
}

String _timeOfDayToString(TimeOfDay time) {
  return '${time.hour}:${time.minute}';
}

DateTime? _dateTimeFromString(String? time) {
  if (time == null) return null;
  return DateFormat('dd-MM-yyyy').parse(time);
}

String? _dateTimeToString(DateTime? time) {
  if (time == null) return null;
  return DateFormat('dd-MM-yyyy').format(time);
}
