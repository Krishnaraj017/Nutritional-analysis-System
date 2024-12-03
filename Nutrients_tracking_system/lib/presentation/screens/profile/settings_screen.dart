import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:statedemo/gen/assets.gen.dart';
import 'package:statedemo/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:statedemo/presentation/cubits/sync_cubit/sync_cubit.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';
import 'package:statedemo/presentation/widgets/rosette_primary_button.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Future _packageInfoFuture = PackageInfo.fromPlatform();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              DecoratedBox(
                decoration: Theme.of(context).rosetteCardDecoration,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Account Settings',
                        style: Theme.of(context).textTheme.regularBold,
                      ),
                      const Gap(16),
                      _Item(
                        svgPath: Assets.icons.profile.path,
                        title: 'Log out Now',
                        buttonTitle: 'Logout',
                        onTap: () {
                          context.read<AuthCubit>().logout();
                        },
                      ),
                      const Gap(16),
                      _Item(
                        svgPath: Assets.icons.profile.path,
                        title: 'Reset all the Data',
                        buttonTitle: 'Reset Now',
                        onTap: () {},
                      ),
                      const Gap(16),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return _Item(
                            svgPath: Assets.icons.profile.path,
                            title: 'Sync Data',
                            subtitle: state.user?.lastSyncedAt != null
                                ? 'Last Synced at ${DateFormat('dd MMM yyyy hh:mm a').format(state.user!.lastSyncedAt!)}'
                                : null,
                            buttonTitle: 'Sync Now',
                            onTap: () {
                              context.read<SyncCubit>().syncAll();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(20),
              FutureBuilder(
                future: _packageInfoFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const SizedBox.shrink();
                    }
                    if (snapshot.data == null) {
                      return const SizedBox.shrink();
                    }
                    final PackageInfo packageInfo =
                        snapshot.data as PackageInfo;
                    return Text(
                      'App Version: ${packageInfo.version} (${packageInfo.buildNumber})',
                      style: Theme.of(context).textTheme.bodySmall,
                    );
                  }
                  return const SizedBox.shrink();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String svgPath;
  final String title;
  final String? subtitle;
  final String buttonTitle;
  final VoidCallback onTap;

  const _Item({
    required this.svgPath,
    required this.title,
    this.subtitle,
    required this.buttonTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          svgPath,
          width: 24,
          height: 24,
        ),
        const Gap(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              if (subtitle != null) ...[
                const Gap(4),
                Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ],
          ),
        ),
        const Gap(16),
        RosettePrimaryButton(
          onPressed: onTap,
          width: 140,
          height: 40,
          child: Text(
            buttonTitle,
            style: Theme.of(context).textTheme.regular,
          ),
        ),
      ],
    );
  }
}
