part of 'hydration_weekly_cubit.dart';

abstract class HydrationWeeklyState extends Equatable {
  final Map<DateTime, Hydration>? weeklyHydrations;

  const HydrationWeeklyState({this.weeklyHydrations});
}

class HydrationWeeklyInitial extends HydrationWeeklyState {
  @override
  List<Object> get props => [];
}

class HydrationWeeklyLoaded extends HydrationWeeklyState {
  const HydrationWeeklyLoaded({
    required Map<DateTime, Hydration> weeklyHydrations,
  }) : super(weeklyHydrations: weeklyHydrations);

  @override
  List<Object?> get props => [weeklyHydrations];
}
