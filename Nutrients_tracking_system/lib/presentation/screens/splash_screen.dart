import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:statedemo/data/models/food_item.dart';
import 'package:statedemo/data/models/hydration.dart';
import 'package:statedemo/data/models/reminders.dart';
import 'package:statedemo/data/models/sleep.dart';
import 'package:statedemo/di/get_it.dart';
import 'package:statedemo/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:statedemo/presentation/cubits/local_app_info_cubit/local_app_info_cubit.dart';
import 'package:statedemo/presentation/routes/app_router.dart';
import 'package:statedemo/presentation/screens/food/model/food_items.dart';

import '../widgets/custom_loader.dart';

@RoutePage()
class SplashScreen extends StatefulWidget implements AutoRouteWrapper {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LocalAppInfoCubit>()..getLocalAppInfo(),
      child: this,
    );
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initialiseIsar(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CustomLoader(),
            );
          }
          return BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is Authenticated) {
                if (!state.user!.isOnboardingCompleted) {
                  context.router.push(const RegistrationRoute());
                  return;
                }
                context.router.popAndPush(const DashboardRoute());
              }
              if (state is Unauthenticated) {
                final localAppInfoState =
                    context.read<LocalAppInfoCubit>().state;
                if (localAppInfoState.localAppInfo == null) {
                  context.router.push(const OnboardingMainRoute());
                  return;
                }
                context.router.push(const AuthRoute());
              }
            },
            builder: (context, state) {
              return const Center(
                child: CustomLoader(),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _initialiseIsar() async {
    final directory = await getApplicationDocumentsDirectory();
    await Isar.open(
      [HydrationSchema, SleepSchema, ReminderSchema,FoodItemSchema,FoodItemsSchema],
      directory: directory.path,
    );
    return;
  }
}
