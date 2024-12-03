import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:statedemo/domain/entities/local_app_info.dart';
import 'package:statedemo/domain/repositories/user_repository.dart';
import 'package:statedemo/presentation/cubits/local_app_info_cubit/local_app_info_state.dart';

@injectable
class LocalAppInfoCubit extends Cubit<LocalAppInfoState> {
  final UserRepository _userRepository;

  LocalAppInfoCubit(this._userRepository)
      : super(const LocalAppInfoState(null, null));

  Future<void> getLocalAppInfo() async {
    var result = await _userRepository.getLocalAppInfo();
    result.fold((l) {
      emit(LocalAppInfoState(null, l));
    }, (r) {
      if (isClosed) return;
      emit(LocalAppInfoState(r, null));
    });
  }

  void updateLocalAppInfo(LocalAppInfo localAppInfo) {
    _userRepository.updateLocalAppInfo(localAppInfo: localAppInfo);
    emit(LocalAppInfoState(localAppInfo, null));
  }
}
