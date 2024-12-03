import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:statedemo/di/get_it.dart';
import 'package:statedemo/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:statedemo/presentation/cubits/registration_data_cubit/registration_data_cubit.dart';
import 'package:statedemo/presentation/routes/app_router.dart';
import 'package:statedemo/presentation/screens/registration/pageviews/add_dob_pageview.dart';
import 'package:statedemo/presentation/screens/registration/pageviews/add_gender_pageview.dart';
import 'package:statedemo/presentation/screens/registration/pageviews/add_height_pageview.dart';
import 'package:statedemo/presentation/screens/registration/pageviews/add_name_pageview.dart';
import 'package:statedemo/presentation/screens/registration/pageviews/add_weight_pageview.dart';
import 'package:statedemo/presentation/theme/app_colors.dart';
import 'package:statedemo/presentation/widgets/app_background.dart';
import 'package:statedemo/presentation/widgets/rosette_primary_button.dart';
import 'package:statedemo/utils/extensions/build_context_extensions.dart';

import '../../cubits/profile/profile_cubit/profile_cubit.dart';

@RoutePage()
class RegistrationScreen extends StatefulWidget implements AutoRouteWrapper {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<ProfileCubit>(),
        ),
        BlocProvider(
          create: (context) =>
              RegistrationDataCubit(context.read<AuthCubit>().state.user!),
        ),
      ],
      child: this,
    );
  }
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final PageController _controller = PageController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  final List<Widget> _pages = const [
    AddNamePageView(),
    AddGenderPageView(),
    AddDobPageView(),
    AddWeightPageView(),
    AddHeightPageView(),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _handlePop(val) {
    if (_currentPage.value == 0) return true;
    _previousPage();
    return false;
  }

  void _nextPage() {
    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    _controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _currentPage.value == 0,
      onPopInvoked: (didPop) {
        final val = _handlePop(didPop);

        if (val) context.router.popForced();
      },
      child: Scaffold(
        body: AppBackground(
          child: BlocListener<ProfileCubit, ProfileState>(
            listener: (context, state) {
              context.handleLoading(state is ProfileLoading);
              if (state is ProfileFailure) {
                context.displayError(error: state.error);
              }
              if (state is ProfileSuccess) {
                context.read<AuthCubit>().updateUser(state.user);
                context.router.replace(const DashboardRoute());
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Gap(32),
                    SmoothPageIndicator(
                      controller: _controller,
                      count: _pages.length,
                      effect: const ExpandingDotsEffect(
                        expansionFactor: 2,
                        activeDotColor: AppColors.primaryColor,
                      ),
                    ),
                    const Gap(32),
                    Expanded(
                      child: PageView.builder(
                        controller: _controller,
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (index) => _currentPage.value = index,
                        itemBuilder: (context, index) =>
                            SingleChildScrollView(child: _pages[index]),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: _currentPage,
                      builder: (context, value, child) => Row(
                        children: [
                          if (value != 0)
                            RosettePrimaryButton(
                              onPressed: _previousPage,
                              width: 52,
                              shape: BoxShape.circle,
                              child: const Icon(Icons.arrow_back_ios),
                            ),
                          const Spacer(),
                          if (value != _pages.length - 1)
                            RosettePrimaryButton(
                              width: 52,
                              onPressed: () {
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }
                                _formKey.currentState!.save();
                                FocusScope.of(context).unfocus();
                                _nextPage();
                              },
                              child: const Icon(Icons.arrow_forward_ios),
                            )
                          else
                            RosettePrimaryButton(
                              width: 150,
                              onPressed: () {
                                final user =
                                    context.read<RegistrationDataCubit>().state;
                                context
                                    .read<ProfileCubit>()
                                    .createProfile(user);
                              },
                              child: const Text('Get Started'),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
