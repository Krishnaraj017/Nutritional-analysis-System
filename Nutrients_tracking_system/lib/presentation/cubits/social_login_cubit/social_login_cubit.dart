import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

part 'social_login_state.dart';

@injectable
class SocialLoginCubit extends Cubit<SocialLoginState> {
  SocialLoginCubit() : super(SocialLoginInitial());

  void login() async {
    emit(SocialLoginLoading());
    try {
      final List<String> scopes = <String>['email'];
      final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: scopes,
      );
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        emit(const SocialLoginError("Google SignIn Cancelled by user"));
        return;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      emit(
        SocialLoginSuccess(
          account: googleUser,
          authentication: googleAuth,
        ),
      );
    } catch (e) {
      print('Error in SocialLoginCubit: $e');
      emit(SocialLoginError(e.toString()));
    }
  }
}
