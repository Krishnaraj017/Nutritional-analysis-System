import 'package:injectable/injectable.dart';
import 'package:statedemo/data/data_sources/local_data_source/reminder_local_data_source.dart';
import 'package:statedemo/data/models/reminders.dart';
import 'package:statedemo/domain/repositories/reminder_repository.dart';

@LazySingleton(as: ReminderRepository)
class ReminderRepositoryImpl implements ReminderRepository {
  final ReminderLocalDataSource _reminderLocalDataSource;
  ReminderRepositoryImpl(this._reminderLocalDataSource);

  @override
  Future<void> addReminder({required Reminder reminder}) async {
    await _reminderLocalDataSource.addReminder(reminder: reminder);
  }

  @override
  Future<List<Reminder>?> getReminders() async {
    return  await _reminderLocalDataSource.getReminders();
  }

  @override
  Future<void> switchIsComplete({required DateTime date}) async {
    await _reminderLocalDataSource.switchIsComplete(date: date);
  }

  @override
  Stream<void> watchReminders() {
    return _reminderLocalDataSource.watchReminders();
  }

  @override
  Future<void> filterReminder() async {
    await _reminderLocalDataSource.filterReminder();
  }
}
