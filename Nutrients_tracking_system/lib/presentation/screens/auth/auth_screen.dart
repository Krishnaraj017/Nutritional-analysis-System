import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:statedemo/data/models/user.dart';
import 'package:statedemo/di/get_it.dart';
import 'package:statedemo/gen/assets.gen.dart';
import 'package:statedemo/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:statedemo/presentation/cubits/generate_otp_cubit/generate_otp_cubit.dart';
import 'package:statedemo/presentation/cubits/generate_otp_cubit/generate_otp_state.dart';
import 'package:statedemo/presentation/cubits/social_login_backend_cubit/social_login_backend_cubit.dart';
import 'package:statedemo/presentation/theme/app_colors.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';
import 'package:statedemo/presentation/widgets/rosette_primary_button.dart';
import 'package:statedemo/utils/extensions/build_context_extensions.dart';
import 'package:statedemo/utils/validators/validators.dart';

import '../../cubits/social_login_cubit/social_login_cubit.dart';
import '../../routes/app_router.dart';

@RoutePage()
class AuthScreen extends StatefulWidget implements AutoRouteWrapper {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<GenerateOtpCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<SocialLoginCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<SocialLoginBackendCubit>(),
        ),
      ],
      child: this,
    );
  }
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _email;

  void _handleAuth(User user) {
    if (!user.isOnboardingCompleted) {
      context.router.replaceAll([const RegistrationRoute()]);
      return;
    }
    context.router.replaceAll([const DashboardRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          _handleAuth(state.user!);
        }
      },
      child: Form(
        key: _formKey,
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    Material(
                      elevation: 4,
                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: AppColors.gradientColors,
                              ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height),
                              );
                            },
                            child: Assets.images.loginBgImage.image(),
                          ),
                          Positioned(
                            bottom: 20,
                            width: MediaQuery.sizeOf(context).width,
                            child: Text(
                              'Make Every Sip \nCount',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.h1Bold.apply(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Text(
                              'Hey There,',
                              style: Theme.of(context).textTheme.regular,
                            ),
                            Text(
                              'Sign In/Log In',
                              style: Theme.of(context).textTheme.h2Medium,
                            ),
                            const Gap(20),
                            TextFormField(
                              validator: Validators.emailValidator,
                              onSaved: (value) => _email = value,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                prefixIcon: Icon(Icons.email_outlined),
                              ),
                            ),
                            const Gap(20),
                            BlocListener<GenerateOtpCubit, GenerateOtpState>(
                              listener: (context, state) {
                                context
                                    .handleLoading(state is GenerateOtpLoading);
                                if (state is GenerateOtpError) {
                                  context.displayError(error: state.appError);
                                }
                                if (state is GenerateOtpSuccess) {
                                  context.router.push(
                                    VerifyEmailRoute(
                                      email: _email!,
                                      token: state.generateOtpResponse.token,
                                    ),
                                  );
                                }
                              },
                              child: RosettePrimaryButton(
                                onPressed: () {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }
                                  _formKey.currentState!.save();
                                  context
                                      .read<GenerateOtpCubit>()
                                      .generateOTP(email: _email!);
                                },
                                child: const Text('Get OTP'),
                              ),
                            ),
                            const Gap(20),
                            const Row(
                              children: [
                                Expanded(child: Divider()),
                                Text('Or'),
                                Expanded(child: Divider()),
                              ],
                            ),
                            const Gap(20),
                            MultiBlocListener(
                              listeners: [
                                BlocListener<SocialLoginCubit,
                                    SocialLoginState>(
                                  listener: (context, state) {
                                    context.handleLoading(
                                      state is SocialLoginLoading,
                                    );
                                    if (state is SocialLoginError) {
                                      context.displayErrorMessage(
                                        message: state.message,
                                      );
                                    }
                                    if (state is SocialLoginSuccess) {
                                      context
                                          .read<SocialLoginBackendCubit>()
                                          .login(state.account.email);
                                    }
                                  },
                                ),
                                BlocListener<SocialLoginBackendCubit,
                                    SocialLoginBackendState>(
                                  listener: (context, state) {
                                    context.handleLoading(
                                      state is SocialLoginBackendLoading,
                                    );
                                    if (state is SocialLoginBackendError) {
                                      context.displayError(error: state.error);
                                    }
                                    if (state is SocialLoginBackendSuccess) {
                                      context
                                          .read<AuthCubit>()
                                          .authenticate(user: state.user);
                                    }
                                  },
                                ),
                              ],
                              child: SignInButton(
                                Buttons.google,
                                onPressed: () {
                                  context.read<SocialLoginCubit>().login();
                                },
                                padding: const EdgeInsets.all(4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
