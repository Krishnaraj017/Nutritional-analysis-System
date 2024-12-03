import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:statedemo/domain/entities/app_error.dart';

import '../../../../data/models/user.dart';
import '../../../../domain/repositories/user_repository.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final UserRepository _userRepository;

  ProfileCubit(this._userRepository) : super(ProfileInitial());

  Future<void> createProfile(User user) async {
    emit(ProfileLoading());
    final res = await _userRepository.createProfile(params: user.toJson());
    res.fold(
      (l) => emit(ProfileFailure(l)),
      (r) => emit(ProfileSuccess(user)),
    );
  }

  Future<void> updateProfile(User user) async {
    emit(ProfileLoading());
    final res = await _userRepository.updateProfile(params: user.toJson());
    res.fold(
      (l) => emit(ProfileFailure(l)),
      (r) => emit(ProfileSuccess(user)),
    );
  }
}
