part of 'social_login_backend_cubit.dart';

abstract class SocialLoginBackendState extends Equatable {
  const SocialLoginBackendState();
}

class SocialLoginBackendInitial extends SocialLoginBackendState {
  @override
  List<Object> get props => [];
}

class SocialLoginBackendLoading extends SocialLoginBackendState {
  @override
  List<Object> get props => [];
}

class SocialLoginBackendSuccess extends SocialLoginBackendState {
  final User user;

  const SocialLoginBackendSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class SocialLoginBackendError extends SocialLoginBackendState {
  final AppError error;

  const SocialLoginBackendError(this.error);

  @override
  List<Object> get props => [error];
}
