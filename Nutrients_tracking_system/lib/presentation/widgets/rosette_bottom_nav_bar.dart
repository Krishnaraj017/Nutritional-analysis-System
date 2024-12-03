import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:statedemo/gen/assets.gen.dart';
import 'package:statedemo/presentation/cubits/bottom_navbar_cubit/bottom_nav_bar_cubit.dart';
import 'package:statedemo/presentation/routes/app_router.dart';
import 'package:statedemo/presentation/theme/app_colors.dart';

class RosetteBottomNavBar extends StatelessWidget {
  const RosetteBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarItem>(
      builder: (context, state) {
        return SizedBox(
          height: 70,
          child: ColoredBox(
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor ??
                Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _RosetteBottomBarButton(
                  iconPath: Assets.icons.home.path,
                  isSelected: state == BottomNavBarItem.home,
                  text: 'Home',
                  onPressed: () {
                    context
                        .read<BottomNavBarCubit>()
                        .updateSelectedItem(BottomNavBarItem.home);
                  },
                ),
                _RosetteBottomBarButton(
                  iconPath: Assets.icons.edit.path,
                  isSelected: state == BottomNavBarItem.water,
                  text: 'Soon',
                  onPressed: () {
                    context.router.push(const UnderDevelopmentRoute());
                  },
                ),
                Align(
                  alignment: const Alignment(0, -7),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context
                              .read<BottomNavBarCubit>()
                              .updateSelectedItem(BottomNavBarItem.health);
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 6,
                          shape: const CircleBorder(),
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: AppColors.gradientColors,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Assets.icons.heart.svg(),
                            ),
                          ),
                        ),
                      ),
                      const Gap(2),
                      AnimatedContainer(
                        height: 4,
                        width: state == BottomNavBarItem.health ? 28 : 0,
                        duration: const Duration(milliseconds: 300),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          gradient: LinearGradient(
                            colors: AppColors.gradientColors,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _RosetteBottomBarButton(
                  iconPath: Assets.icons.meals.path,
                  isSelected: state == BottomNavBarItem.meals,
                  text: 'Food',
                  onPressed: () {
                    context
                        .read<BottomNavBarCubit>()
                        .updateSelectedItem(BottomNavBarItem.meals);
                  },
                ),
                _RosetteBottomBarButton(
                  iconPath: Assets.icons.profile.path,
                  isSelected: state == BottomNavBarItem.profile,
                  text: 'Profile',
                  onPressed: () {
                    context
                        .read<BottomNavBarCubit>()
                        .updateSelectedItem(BottomNavBarItem.profile);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _RosetteBottomBarButton extends StatelessWidget {
  final String iconPath;
  final bool isSelected;
  final VoidCallback onPressed;
  final String text;
  const _RosetteBottomBarButton({
    required this.iconPath,
    required this.isSelected,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      onTap: () {
        HapticFeedback.mediumImpact();
        onPressed();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 28,
              height: 28,
            ),
            Text(text),
            Gap(1),
            AnimatedContainer(
              height: 4,
              width: isSelected ? 28 : 0,
              duration: const Duration(milliseconds: 300),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                gradient: LinearGradient(
                  colors: AppColors.gradientColors,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
