import 'package:statedemo/data/models/reminders.dart';

abstract class ReminderRepository {
  Future<List<Reminder>?> getReminders();

  Stream<void> watchReminders();

  Future<void> addReminder({required Reminder reminder});

  Future<void> switchIsComplete({required DateTime date});

  Future<void> filterReminder();
}
