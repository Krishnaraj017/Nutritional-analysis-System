part of 'social_login_cubit.dart';

abstract class SocialLoginState extends Equatable {
  const SocialLoginState();
}

class SocialLoginInitial extends SocialLoginState {
  @override
  List<Object> get props => [];
}

class SocialLoginLoading extends SocialLoginState {
  @override
  List<Object> get props => [];
}

class SocialLoginSuccess extends SocialLoginState {
  final GoogleSignInAccount account;
  final GoogleSignInAuthentication authentication;

  const SocialLoginSuccess({
    required this.account,
    required this.authentication,
  });

  @override
  List<Object> get props => [account, authentication];
}

class SocialLoginError extends SocialLoginState {
  final String message;

  const SocialLoginError(this.message);

  @override
  List<Object> get props => [message];
}
