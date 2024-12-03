import 'package:clock/clock.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:statedemo/data/models/reminders.dart';

abstract class ReminderLocalDataSource {
  Future<List<Reminder>?> getReminders();

  Future<void> addReminder({
    required Reminder reminder,
  });

  Future<void> deleteReminder({required DateTime date});

  Future<void> switchIsComplete({required DateTime date});

  Stream<void> watchReminders();

  Future<void> filterReminder();
}

@LazySingleton(as: ReminderLocalDataSource)
class ReminderLocalDataSourceImp extends ReminderLocalDataSource {
  final Isar _isar = Isar.getInstance()!;

  @override
  Future<List<Reminder>?> getReminders() async {
    return await _isar.reminders.where().findAll();
  }

  @override
  Future<void> addReminder({
    required Reminder reminder,
  }) async {
    await _isar.writeTxn(() => _isar.reminders.put(reminder));
  }

  @override
  Future<void> deleteReminder({required DateTime date}) async {
    await _isar.writeTxn(() => _isar.reminders.deleteByDate(date));
  }

  @override
  Future<void> switchIsComplete({
    required DateTime date,
  }) async {
    Reminder? reminder = await _isar.reminders.getByDate(date);
    bool currentIsComplete =
        reminder!.isComplete; // get it initial value of the reminder
    reminder = reminder.copyWith(
        isComplete: currentIsComplete ? false : true); //switch the value
    await _isar.writeTxn(() => _isar.reminders.put(reminder!));
  }

  @override
  Stream<void> watchReminders() {
    return _isar.reminders.watchLazy();
  }

  /// removes reminders that are older than a week and that are already set to true
  @override
  Future<void> filterReminder() async {
    List<Reminder>? invalReminders = await _isar
        .reminders // get the list of objects that does not follow the conditions
        .filter()
        .dateLessThan(clock.now().subtract(const Duration(days: 7)))
        .or()
        .isCompleteEqualTo(true)
        .findAll();
    List<DateTime> invalRemindersDates = <DateTime>[]; //store their dates
    for (int i = 0; i < invalReminders.length; i++) {
      invalRemindersDates.add(invalReminders[i].date);
    }
    await _isar.writeTxn(() =>
        _isar.reminders.deleteAllByDate(invalRemindersDates)); // delete them
  }
}
