import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:statedemo/data/models/user.dart';
import 'package:statedemo/gen/assets.gen.dart';
import 'package:statedemo/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:statedemo/presentation/routes/app_router.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is Authenticated) {
              final User user = state.user!;

              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Gap(32),
                      Assets.icons.profile.svg(
                        height: 100,
                        width: 100,
                      ),
                      const Gap(4),
                      Text(
                        user.name ?? '-',
                        style: Theme.of(context).textTheme.h2Bold,
                        textAlign: TextAlign.center,
                      ),
                      const Gap(32),
                      Container(
                        decoration: Theme.of(context).rosetteCardDecoration,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Material(
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              const Gap(24),
                              _AccountRow(
                                iconPath: Assets.icons.profileRounded.path,
                                title: 'Profile',
                                onTap: () {
                                  context.router.push(const EditProfileRoute());
                                },
                              ),
                              _AccountRow(
                                iconPath: Assets.icons.devices.path,
                                title: 'Devices',
                                onTap: () {
                                  context.router
                                      .push(const UnderDevelopmentRoute());
                                },
                              ),
                              _AccountRow(
                                iconPath: Assets.icons.notification.path,
                                title: 'Notifications',
                                onTap: () {
                                  context.router
                                      .push(const UnderDevelopmentRoute());
                                },
                              ),
                              _AccountRow(
                                iconPath: Assets.icons.communities.path,
                                title: 'Community',
                                onTap: () {
                                  context.router
                                      .push(const UnderDevelopmentRoute());
                                },
                              ),
                              _AccountRow(
                                iconPath: Assets.icons.settings.path,
                                title: 'Settings',
                                onTap: () {
                                  context.router.push(const SettingsRoute());
                                },
                              ),
                              const Gap(24),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class _AccountRow extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback? onTap;

  const _AccountRow({
    required this.iconPath,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      leading: SvgPicture.asset(
        iconPath,
        width: 24,
        height: 24,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.h3Medium,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.grey,
      ),
    );
  }
}
