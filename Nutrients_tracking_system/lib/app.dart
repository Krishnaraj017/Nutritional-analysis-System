import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:statedemo/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:statedemo/presentation/cubits/bottom_navbar_cubit/bottom_nav_bar_cubit.dart';
import 'package:statedemo/presentation/cubits/l;ast_7_days_cubit/last7_days_cubit.dart';
import 'package:statedemo/presentation/cubits/sync_cubit/sync_cubit.dart';
import 'package:statedemo/presentation/cubits/weather_cubit/weather_cubit.dart';
import 'package:statedemo/presentation/routes/app_router.dart';
import 'package:statedemo/presentation/theme/app_colors.dart';
import 'package:statedemo/presentation/theme/app_theme.dart';
import 'package:statedemo/presentation/widgets/custom_loader.dart';

import 'di/get_it.dart';
import 'flavors.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => getIt<AuthCubit>()..checkAuth(),
        ),
        BlocProvider<BottomNavBarCubit>(
          create: (_) => getIt<BottomNavBarCubit>(),
        ),
        BlocProvider<SyncCubit>(
          create: (_) => getIt<SyncCubit>(),
        ),
        BlocProvider<Last7DaysCubit>(
          create: (_) => getIt<Last7DaysCubit>(),
        ),
        BlocProvider<WeatherCubit>(
          create: (_) => getIt<WeatherCubit>(),
        ),
      ],
      child: GlobalLoaderOverlay(
        overlayColor: Colors.black.withOpacity(0.5),
        overlayWidgetBuilder: (progress) => const Center(child: CustomLoader()),
        useDefaultLoading: false,
        child: MaterialApp.router(
          routerConfig: _appRouter.config(),
          theme: AppTheme.lightTheme(context),
          builder: (context, child) => _flavorBanner(
            child: CupertinoTheme(
              data: CupertinoTheme.of(context).copyWith(
                textTheme: CupertinoTheme.of(context).textTheme.copyWith(
                      dateTimePickerTextStyle: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(
                            color: AppColors.primaryColor,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 20.0,
                          ),
                      pickerTextStyle: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(
                            color: AppColors.primaryColor,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 20.0,
                          ),
                    ),
              ),
              child: child!,
            ),
            show: F.appFlavor == Flavor.dev,
          ),
        ),
      ),
    );
  }
}

Widget _flavorBanner({
  required Widget child,
  bool show = true,
}) =>
    show
        ? Banner(
            location: BannerLocation.topStart,
            message: F.name,
            color: Colors.green.withOpacity(0.6),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12.0,
              letterSpacing: 1.0,
            ),
            textDirection: TextDirection.ltr,
            child: child,
          )
        : child;
