import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:statedemo/gen/assets.gen.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';

class UnderDevelopmentWidget extends StatelessWidget {
  const UnderDevelopmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Page Under Construction,',
              style: Theme.of(context).textTheme.h3,
              textAlign: TextAlign.center,
            ),
            const Gap(24),
            Assets.svgs.underDevelopment.svg(),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
