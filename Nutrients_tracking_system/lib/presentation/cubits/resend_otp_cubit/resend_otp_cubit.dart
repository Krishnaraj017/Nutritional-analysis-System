import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:statedemo/domain/entities/params/generate_otp_params.dart';
import 'package:statedemo/domain/repositories/user_repository.dart';
import 'package:statedemo/presentation/cubits/resend_otp_cubit/resend_otp_state.dart';

@injectable
class ResendOtpCubit extends Cubit<ResendOtpState> {
  final UserRepository _userRepository;

  ResendOtpCubit(this._userRepository) : super(ResendOtpInitialState());

  Future<void> resendOtp({required email}) async {
    emit(ResendOtpLoadingState());
    var response = await _userRepository.generateOtp(
        params: GenerateOtpParams(userEmail: email).toJson(),);
    response.fold((l) {
      emit(ResendOtpErrorState(l));
      emit(ResendOtpInitialState());
    }, (r) {
      emit(ResendOtpSuccessState(r));
      emit(ResendOtpInitialState());
    });
  }
}
