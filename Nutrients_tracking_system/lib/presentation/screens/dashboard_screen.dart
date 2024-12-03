import 'package:auto_route/auto_route.dart';
import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statedemo/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:statedemo/presentation/cubits/bottom_navbar_cubit/bottom_nav_bar_cubit.dart';
import 'package:statedemo/presentation/cubits/l;ast_7_days_cubit/last7_days_cubit.dart';
import 'package:statedemo/presentation/cubits/sync_cubit/sync_cubit.dart';
import 'package:statedemo/presentation/routes/app_router.dart';
import 'package:statedemo/presentation/widgets/rosette_bottom_nav_bar.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SyncCubit>().syncAll();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final user = context.read<AuthCubit>().state.user;
    if (!user!.last7daysSynced) {
      context.read<Last7DaysCubit>().getLast7DaysData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SyncCubit, SyncState>(
      listener: (context, state) {
        if (state is SyncSuccess) {
          // update the last sync time in the user local data source
          final user = context.read<AuthCubit>().state.user;
          if (user != null) {
            context
                .read<AuthCubit>()
                .updateUser(user.copyWith(lastSyncedAt: clock.now()));
          }
        }
      },
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is Unauthenticated) {
            context.router.replaceAll([const OnboardingMainRoute()]);
          }
        },
        child: PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            final currentPageIndex =
                context.read<BottomNavBarCubit>().state.index;
            if (currentPageIndex == 0) {
              return;
            } else {
              context
                  .read<BottomNavBarCubit>()
                  .updateSelectedItem(BottomNavBarItem.home);
            }
          },
          child: AutoTabsScaffold(
            // transitionBuilder: (context, child, animation) {
            //   // make the page come up from bottom with fade in transition
            //   return FadeTransition(
            //     opacity: animation,
            //     child: SlideTransition(
            //       position: Tween<Offset>(
            //         begin: const Offset(0, 0.05),
            //         end: Offset.zero,
            //       ).animate(animation),
            //       child: child,
            //     ),
            //   );
            // },

            routes: const [
              HomeRoute(),
              HydrationDashboardRoute(),
              MyHealthRoute(),
              FoodRoute(),
              ProfileRoute(),
            ],
            bottomNavigationBuilder: (context, tabsRouter) {
              return BlocListener<BottomNavBarCubit, BottomNavBarItem>(
                listener: (context, state) {
                  tabsRouter.setActiveIndex(state.index);
                },
                child: const RosetteBottomNavBar(),
              );
            },
          ),
        ),
      ),
    );
  }
}
