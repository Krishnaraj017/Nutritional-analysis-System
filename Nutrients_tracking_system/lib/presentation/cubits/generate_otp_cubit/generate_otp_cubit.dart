import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:statedemo/domain/entities/params/generate_otp_params.dart';
import 'package:statedemo/domain/repositories/user_repository.dart';
import 'package:statedemo/presentation/cubits/generate_otp_cubit/generate_otp_state.dart';

@injectable
class GenerateOtpCubit extends Cubit<GenerateOtpState> {
  final UserRepository _userRepository;

  GenerateOtpCubit(this._userRepository) : super(GenerateOtpInitial());

  Future<void> generateOTP({required String email}) async {
    emit(GenerateOtpLoading());
    final response = await _userRepository.generateOtp(
      params: GenerateOtpParams(userEmail: email).toJson(),
    );
    emit(
      response.fold(
        (l) => GenerateOtpError(l),
        (r) => GenerateOtpSuccess(r),
      ),
    );
  }
}
