// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddSleepTimeRoute.name: (routeData) {
      final args = routeData.argsAs<AddSleepTimeRouteArgs>(
          orElse: () => const AddSleepTimeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: AddSleepTimeScreen(
          key: args.key,
          sleep: args.sleep,
        )),
      );
    },
    AuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const AuthScreen()),
      );
    },
    CameraRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CameraScreen(),
      );
    },
    ConfirmRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const ConfirmScreen()),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardScreen(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const EditProfileScreen()),
      );
    },
    FoodRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FoodPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    HydrationDashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const HydrationDashboardScreen()),
      );
    },
    MyHealthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyHealthPage(),
      );
    },
    NutritionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NutritionScreen(),
      );
    },
    OnboardingMainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const OnboardingMainScreen()),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    RegistrationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const RegistrationScreen()),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    ShowFoodRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ShowFoodScreen(),
      );
    },
    SleepTrackerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const SleepTrackerScreen()),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const SplashScreen()),
      );
    },
    UnderDevelopmentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UnderDevelopmentScreen(),
      );
    },
    VerifyEmailRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyEmailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: VerifyEmailScreen(
          key: args.key,
          email: args.email,
          token: args.token,
        )),
      );
    },
  };
}

/// generated route for
/// [AddSleepTimeScreen]
class AddSleepTimeRoute extends PageRouteInfo<AddSleepTimeRouteArgs> {
  AddSleepTimeRoute({
    Key? key,
    Sleep? sleep,
    List<PageRouteInfo>? children,
  }) : super(
          AddSleepTimeRoute.name,
          args: AddSleepTimeRouteArgs(
            key: key,
            sleep: sleep,
          ),
          initialChildren: children,
        );

  static const String name = 'AddSleepTimeRoute';

  static const PageInfo<AddSleepTimeRouteArgs> page =
      PageInfo<AddSleepTimeRouteArgs>(name);
}

class AddSleepTimeRouteArgs {
  const AddSleepTimeRouteArgs({
    this.key,
    this.sleep,
  });

  final Key? key;

  final Sleep? sleep;

  @override
  String toString() {
    return 'AddSleepTimeRouteArgs{key: $key, sleep: $sleep}';
  }
}

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CameraScreen]
class CameraRoute extends PageRouteInfo<void> {
  const CameraRoute({List<PageRouteInfo>? children})
      : super(
          CameraRoute.name,
          initialChildren: children,
        );

  static const String name = 'CameraRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ConfirmScreen]
class ConfirmRoute extends PageRouteInfo<void> {
  const ConfirmRoute({List<PageRouteInfo>? children})
      : super(
          ConfirmRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfirmRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditProfileScreen]
class EditProfileRoute extends PageRouteInfo<void> {
  const EditProfileRoute({List<PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FoodPage]
class FoodRoute extends PageRouteInfo<void> {
  const FoodRoute({List<PageRouteInfo>? children})
      : super(
          FoodRoute.name,
          initialChildren: children,
        );

  static const String name = 'FoodRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HydrationDashboardScreen]
class HydrationDashboardRoute extends PageRouteInfo<void> {
  const HydrationDashboardRoute({List<PageRouteInfo>? children})
      : super(
          HydrationDashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'HydrationDashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyHealthPage]
class MyHealthRoute extends PageRouteInfo<void> {
  const MyHealthRoute({List<PageRouteInfo>? children})
      : super(
          MyHealthRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyHealthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NutritionScreen]
class NutritionRoute extends PageRouteInfo<void> {
  const NutritionRoute({List<PageRouteInfo>? children})
      : super(
          NutritionRoute.name,
          initialChildren: children,
        );

  static const String name = 'NutritionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingMainScreen]
class OnboardingMainRoute extends PageRouteInfo<void> {
  const OnboardingMainRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingMainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegistrationScreen]
class RegistrationRoute extends PageRouteInfo<void> {
  const RegistrationRoute({List<PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ShowFoodScreen]
class ShowFoodRoute extends PageRouteInfo<void> {
  const ShowFoodRoute({List<PageRouteInfo>? children})
      : super(
          ShowFoodRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShowFoodRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SleepTrackerScreen]
class SleepTrackerRoute extends PageRouteInfo<void> {
  const SleepTrackerRoute({List<PageRouteInfo>? children})
      : super(
          SleepTrackerRoute.name,
          initialChildren: children,
        );

  static const String name = 'SleepTrackerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UnderDevelopmentScreen]
class UnderDevelopmentRoute extends PageRouteInfo<void> {
  const UnderDevelopmentRoute({List<PageRouteInfo>? children})
      : super(
          UnderDevelopmentRoute.name,
          initialChildren: children,
        );

  static const String name = 'UnderDevelopmentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerifyEmailScreen]
class VerifyEmailRoute extends PageRouteInfo<VerifyEmailRouteArgs> {
  VerifyEmailRoute({
    Key? key,
    required String email,
    required String token,
    List<PageRouteInfo>? children,
  }) : super(
          VerifyEmailRoute.name,
          args: VerifyEmailRouteArgs(
            key: key,
            email: email,
            token: token,
          ),
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static const PageInfo<VerifyEmailRouteArgs> page =
      PageInfo<VerifyEmailRouteArgs>(name);
}

class VerifyEmailRouteArgs {
  const VerifyEmailRouteArgs({
    this.key,
    required this.email,
    required this.token,
  });

  final Key? key;

  final String email;

  final String token;

  @override
  String toString() {
    return 'VerifyEmailRouteArgs{key: $key, email: $email, token: $token}';
  }
}
