import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import 'package:statedemo/domain/entities/params/verify_otp_params.dart';
import 'package:statedemo/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:statedemo/presentation/cubits/generate_otp_cubit/generate_otp_state.dart';
import 'package:statedemo/presentation/cubits/verify_otp_cubit/verify_otp_state.dart';
import 'package:statedemo/presentation/theme/app_colors.dart';
import 'package:statedemo/presentation/theme/pinput_theme.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';
import 'package:statedemo/presentation/widgets/app_background.dart';
import 'package:statedemo/presentation/widgets/rosette_gradient_text.dart';
import 'package:statedemo/presentation/widgets/rosette_primary_button.dart';
import 'package:statedemo/utils/extensions/build_context_extensions.dart';

import '../../../di/get_it.dart';
import '../../cubits/generate_otp_cubit/generate_otp_cubit.dart';
import '../../cubits/verify_otp_cubit/verify_otp_cubit.dart';

@RoutePage()
class VerifyEmailScreen extends StatefulWidget implements AutoRouteWrapper {
  /// The email address of the user entered in the previous screen
  final String email;

  /// The token received from the server in the previous screen
  final String token;

  const VerifyEmailScreen({
    super.key,
    required this.email,
    required this.token,
  });

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<GenerateOtpCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<VerifyOtpCubit>(),
        ),
      ],
      child: this,
    );
  }
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  String? _error;
  String? _otp;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: AppBackground(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Confirm Your Code',
                    style: Theme.of(context).textTheme.h1Medium,
                  ),
                  const Gap(20),
                  Text(
                    'Enter the code we just sent to ${widget.email}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Gap(20),
                  Pinput(
                    length: 4,
                    forceErrorState: _error != null,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    errorText: _error,
                    defaultPinTheme: PinputTheme.defaultPinTheme,
                    errorPinTheme: PinputTheme.errorPinTheme,
                    focusedPinTheme: PinputTheme.focusedPinTheme,
                    onCompleted: (value) {
                      _otp = value;
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the code';
                      }
                      return null;
                    },
                  ),
                  const Gap(20),
                  BlocConsumer<GenerateOtpCubit, GenerateOtpState>(
                    listener: (context, state) {
                      context.handleLoading(state is GenerateOtpLoading);
                    },
                    builder: (context, state) {
                      return TextButton(
                        onPressed: () {},
                        child: const RGradientText(
                          'Send Code Again',
                          gradient: LinearGradient(
                            colors: AppColors.gradientColors,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      );
                    },
                  ),
                  const Gap(20),
                  MultiBlocListener(
                    listeners: [
                      BlocListener<VerifyOtpCubit, VerifyOtpState>(
                        listener: (context, state) {
                          context.handleLoading(state is VerifyOtpLoading);
                          if (state is VerifyOtpSuccess) {
                            context.read<AuthCubit>().authenticate(
                                  user: state.verifyOtpResponse.user,
                                );
                          }
                          if (state is VerifyOtpError) {
                            setState(() {
                              _error = state.appError.message;
                            });
                          }
                        },
                      ),
                    ],
                    child: RosettePrimaryButton(
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) return;
                        context.read<VerifyOtpCubit>().verifyOtp(
                              params: VerifyOtpParams(
                                otp: _otp!,
                                userEmail: widget.email,
                                token: widget.token,
                              ),
                            );
                      },
                      child: const Text('Verify'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
