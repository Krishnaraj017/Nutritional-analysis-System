part of 'last7_days_cubit.dart';

abstract class Last7DaysState extends Equatable {
  const Last7DaysState();
}

class Last7DaysInitial extends Last7DaysState {
  @override
  List<Object> get props => [];
}

class Last7DaysLoading extends Last7DaysState {
  @override
  List<Object> get props => [];
}

class Last7DaysLoaded extends Last7DaysState {
  @override
  List<Object> get props => [];
}

class Last7DaysError extends Last7DaysState {
  final AppError appError;

  Last7DaysError(this.appError);
  @override
  List<Object> get props => [appError];
}
