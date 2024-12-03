part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileSuccess extends ProfileState {
  final User user;

  const ProfileSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class ProfileFailure extends ProfileState {
  final AppError error;

  const ProfileFailure(this.error);

  @override
  List<Object> get props => [error];
}
