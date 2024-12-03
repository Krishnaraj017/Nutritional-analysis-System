part of 'hydration_cubit.dart';

abstract class HydrationState extends Equatable {
  final Hydration? hydration;

  const HydrationState({this.hydration});
}

class HydrationInitial extends HydrationState {
  @override
  List<Object> get props => [];
}

class HydrationLoading extends HydrationState {
  @override
  List<Object> get props => [];
}

class HydrationLoaded extends HydrationState {
  const HydrationLoaded(Hydration hydration) : super(hydration: hydration);

  @override
  List<Object?> get props => [hydration];
}

class HydrationError extends HydrationState {
  final String message;

  const HydrationError(this.message);

  @override
  List<Object> get props => [message];
}
