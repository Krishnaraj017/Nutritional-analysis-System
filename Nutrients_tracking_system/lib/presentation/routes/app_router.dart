import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:statedemo/presentation/screens/dashboard_screen.dart';
import 'package:statedemo/presentation/screens/food/camera_screen.dart';
import 'package:statedemo/presentation/screens/food/confirm_screen.dart';
import 'package:statedemo/presentation/screens/food/nutrition_screen.dart';
import 'package:statedemo/presentation/screens/food/show_food_screen.dart';
import 'package:statedemo/presentation/screens/profile/settings_screen.dart';
import 'package:statedemo/presentation/screens/sleep/add_sleep_time_bottomsheet.dart';
import 'package:statedemo/presentation/screens/splash_screen.dart';

import '../../data/models/sleep.dart';
import '../screens/auth/auth_screen.dart';
import '../screens/auth/verify_email_screen.dart';
import '../screens/food/food_page.dart';
import '../screens/home/home_page.dart';
import '../screens/hydration/hydration_dashboard_screen.dart';
import '../screens/my_health/my_health_page.dart';
import '../screens/onboarding/onboarding_main_screen.dart';
import '../screens/profile/edit_profile_screen.dart';
import '../screens/profile/profile_page.dart';
import '../screens/registration/registration_screen.dart';
import '../screens/sleep/sleep_tracker_screen.dart';
import '../screens/under_development/under_development_screen.dart';

part 'app_router.gr.dart';

@LazySingleton()
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
          keepHistory: false,
        ),
        AutoRoute(
          page: RegistrationRoute.page,
        ),
        AutoRoute(
          page: AuthRoute.page,
        ),
        AutoRoute(page: VerifyEmailRoute.page),
        AutoRoute(page: NutritionRoute.page),
        AutoRoute(
          page: DashboardRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page, initial: true),
            AutoRoute(page: FoodRoute.page),
            AutoRoute(page: ProfileRoute.page),
            AutoRoute(page: MyHealthRoute.page),
            AutoRoute(page: HydrationDashboardRoute.page),
          ],
        ),
        AutoRoute(
          page: SleepTrackerRoute.page,
        ),
        AutoRoute(page: FoodRoute.page),
        AutoRoute(page: ConfirmRoute.page),
        AutoRoute(
          page: EditProfileRoute.page,
        ),
        CustomRoute(
          page: AddSleepTimeRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
          fullscreenDialog: false,
          customRouteBuilder: modalSheetBuilder,
        ),
        AutoRoute(
          page: SettingsRoute.page,
        ),
        AutoRoute(
          page: OnboardingMainRoute.page,
        ),
        AutoRoute(page: ShowFoodRoute.page),
        AutoRoute(
          page: UnderDevelopmentRoute.page,
        ),
        AutoRoute(page: CameraRoute.page),
      ];

  Route<T> modalSheetBuilder<T>(
    BuildContext context,
    Widget child,
    AutoRoutePage<T> page,
  ) {
    return ModalBottomSheetRoute(
      builder: (context) => child,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.7,
      ),
      settings: page,
    );
  }
}

class SearchMealRoute {}
