import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'reminders.freezed.dart';
part 'reminders.g.dart';

@freezed
@Collection(ignore: {"copyWith"})
class Reminder with _$Reminder {
  const Reminder._();

  const factory Reminder({
    @Index(unique: true, replace: true) required DateTime date,
    required String? title,
    @Default(false) bool isComplete,
  }) = _Reminder;

  Id get id => date.microsecondsSinceEpoch;

  factory Reminder.fromJson(Map<String, dynamic> json) =>
    _$ReminderFromJson(json);
}
