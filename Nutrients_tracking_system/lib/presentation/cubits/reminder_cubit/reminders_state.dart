import 'package:equatable/equatable.dart';
import 'package:statedemo/data/models/reminders.dart';

class RemindersState extends Equatable {
  const RemindersState();

  @override
  List<Object?> get props => [];
}

class RemindersLoading extends RemindersState {}

class RemindcersLoaded extends RemindersState {
  final List<Reminder> reminders;
  const RemindcersLoaded(this.reminders);
  @override
  List<Object?> get props => [reminders];
}

class RemindersError extends RemindersState {
  final String errorMessage;

  const RemindersError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
