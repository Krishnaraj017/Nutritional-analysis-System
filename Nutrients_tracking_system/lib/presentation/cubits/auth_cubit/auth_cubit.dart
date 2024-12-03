import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:statedemo/data/models/user.dart';
import 'package:statedemo/domain/entities/app_error.dart';
import 'package:statedemo/domain/repositories/user_repository.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final UserRepository _userRepository;

  AuthCubit(this._userRepository) : super(const AuthLoading());

  Future<void> checkAuth() async {
    emit(const AuthLoading());
    final res = await _userRepository.getUser();
    emit(
      res.fold(
        (l) => AuthError(l),
        (r) => r == null ? const Unauthenticated() : Authenticated(user: r),
      ),
    );
  }

  Future<void> updateUser(User user) async {
    await _userRepository.updateLocalUser(user: user);
    print('user updated');
    emit(Authenticated(user: user));
  }

  Future<void> authenticate({required User user}) async {
    emit(Authenticated(user: user));
  }

  Future<void> logout() async {
    await _userRepository.logout();
    emit(const Unauthenticated());
  }
}
