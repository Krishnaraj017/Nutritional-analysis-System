import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:statedemo/domain/entities/params/verify_otp_params.dart';
import 'package:statedemo/domain/repositories/user_repository.dart';
import 'package:statedemo/presentation/cubits/verify_otp_cubit/verify_otp_state.dart';

@injectable
class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final UserRepository _userRepository;

  VerifyOtpCubit(this._userRepository) : super(VerifyOtpInitial());

  void verifyOtp({required VerifyOtpParams params}) async {
    emit(VerifyOtpLoading());
    var response = await _userRepository.verifyOtp(params: params.toJson());
    emit(response.fold((l) => VerifyOtpError(l), (r) => VerifyOtpSuccess(r)));
  }
}
