part of 'weekly_sleep_cubit.dart';

abstract class WeeklySleepState extends Equatable {
  final Map<DateTime, Sleep> sleeps;
  final List<FlSpot> spots;

  double get totalSleepHours {
    double total = 0;
    sleeps.forEach((key, value) {
      total += value.hours;
    });
    return total;
  }

  double get averageSleepHours {
    return totalSleepHours / sleeps.length;
  }

  Sleep? get todaySleep => sleeps[DateUtils.dateOnly(clock.now())];

  const WeeklySleepState({this.sleeps = const {}, this.spots = const []});
}

class WeeklySleepInitial extends WeeklySleepState {
  @override
  List<Object> get props => [];
}

class WeeklySleepLoading extends WeeklySleepState {
  @override
  List<Object> get props => [];
}

class WeeklySleepLoaded extends WeeklySleepState {
  const WeeklySleepLoaded({required super.sleeps, required super.spots});

  @override
  List<Object> get props => [sleeps];
}
