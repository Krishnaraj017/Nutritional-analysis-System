import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:statedemo/data/models/reminders.dart';
import 'package:statedemo/domain/repositories/reminder_repository.dart';
import 'package:statedemo/presentation/cubits/reminder_cubit/reminders_state.dart';

@injectable
class RemindersCubit extends Cubit<RemindersState> {
  final ReminderRepository _reminderRepository;
  late final StreamSubscription _remindersSubscription;
  RemindersCubit(this._reminderRepository) : super(RemindersLoading()) {
    _remindersSubscription =
        _reminderRepository.watchReminders().listen((_) => getReminders());
  }

  void getReminders() async {
    var reminders = await _reminderRepository.getReminders();
    reminders ??= List
        .empty(); // if the reminder is null we send an empty list to avoid additional checks
    emit(RemindcersLoaded(reminders));
  }

  void addReminder({
    required DateTime date,
    required String title,
    bool isComplete = false,
  }) {
    final reminder = Reminder(
      date: date,
      title: title,
    );
    _reminderRepository.addReminder(reminder: reminder);
  }

  void switchIsComplete({required DateTime date}) {
    _reminderRepository.switchIsComplete(date: date);
  }

  @override
  Future<void> close() {
    _remindersSubscription.cancel();
    return super.close();
  }

  void filerReminder() {
    _reminderRepository.filterReminder();
  }
}
