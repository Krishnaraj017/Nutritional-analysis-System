import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statedemo/di/get_it.dart';
import 'package:statedemo/gen/assets.gen.dart';
import 'package:statedemo/presentation/cubits/local_app_info_cubit/local_app_info_cubit.dart';
import 'package:statedemo/presentation/screens/onboarding/pageviews/onboarding_page_view.dart';
import 'package:statedemo/presentation/screens/onboarding/widgets/onboarding_progress_button.dart';

import '../../routes/app_router.dart';
import '../../widgets/circle_widget.dart';

@RoutePage()
class OnboardingMainScreen extends StatefulWidget implements AutoRouteWrapper {
  const OnboardingMainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _OnboardingState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<LocalAppInfoCubit>()..getLocalAppInfo(),
        child: this,);
  }
}

class _OnboardingState extends State<OnboardingMainScreen>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  ValueNotifier<int> activePageNotifier = ValueNotifier(0);

  static final List<OnboardingData> _onboadingDatas = [
    OnboardingData(
      mainTitle: 'Welcome to WellWise',
      title: 'We love to see you here',
      subtitle: 'Let\'s Stay Healthy',
      imagePath: Assets.svgs.onboardingOne.path,
    ),
    OnboardingData(
      title: 'By Hydrating Ourselves',
      subtitle: 'Regularly',
      imagePath: Assets.svgs.onboardingTwo.path,
    ),
    OnboardingData(
      title: 'By Choosing and Consuming Right Proportion of Food',
      subtitle: 'Time to Time',
      imagePath: Assets.svgs.onboardingThree.path,
    ),
    OnboardingData(
      title: 'By Exercising Regularly',
      subtitle: 'And Staying Fit',
      imagePath: Assets.svgs.onboardingFour.path,
    ),
  ];

  static const _circleRadius = 181.0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_pageController.page == 0) {
          return true;
        } else {
          await _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,);
          return false;
        }
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            const Positioned(
              top: -_circleRadius / 2,
              right: -_circleRadius / 2,
              child: ShadowCircle(radius: _circleRadius),
            ),
            const Positioned(
              bottom: -_circleRadius / 2,
              left: -_circleRadius / 2,
              child: ShadowCircle(radius: _circleRadius),
            ),
            PageView.builder(
              controller: _pageController,
              itemCount: _onboadingDatas.length,
              onPageChanged: (index) {
                activePageNotifier.value = index;
              },
              itemBuilder: (context, index) {
                return OnboardingPageView(
                  onboardingData: _onboadingDatas[index],
                );
              },
            ),
            Positioned(
              bottom: 60,
              right: 40,
              child: ValueListenableBuilder(
                valueListenable: activePageNotifier,
                builder: (context, value, child) => OnboardingProgressButton(
                    value: (value + 1) / (_onboadingDatas.length),
                    onPressed: () {
                      if (value == _onboadingDatas.length - 1) {
                        context.pushRoute(const AuthRoute());
                      } else {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,);
                      }
                    },),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
