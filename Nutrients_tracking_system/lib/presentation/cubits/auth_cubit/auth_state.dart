part of 'auth_cubit.dart';

abstract class AuthState {
  final User? user;

  const AuthState({
    this.user,
  });
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class Unauthenticated extends AuthState {
  const Unauthenticated();
}

class Authenticated extends AuthState {
  const Authenticated({
    required User user,
  }) : super(
          user: user,
        );
}

class AuthError extends AuthState {
  final AppError error;

  const AuthError(this.error);
}
