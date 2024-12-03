import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:statedemo/domain/entities/app_error.dart';

import '../../../data/models/user.dart';
import '../../../domain/entities/params/social_login_params.dart';
import '../../../domain/repositories/user_repository.dart';

part 'social_login_backend_state.dart';

@injectable
class SocialLoginBackendCubit extends Cubit<SocialLoginBackendState> {
  final UserRepository _userRepository;

  SocialLoginBackendCubit(this._userRepository)
      : super(SocialLoginBackendInitial());

  void login(String email) async {
    emit(SocialLoginBackendLoading());

    final res = await _userRepository.socialLogin(
      params: SocialLoginParams(userEmail: email).toJson(),
    );
    emit(
      res.fold(
        (l) {
          return SocialLoginBackendError(l);
        },
        (r) => SocialLoginBackendSuccess(r.user),
      ),
    );
  }
}
