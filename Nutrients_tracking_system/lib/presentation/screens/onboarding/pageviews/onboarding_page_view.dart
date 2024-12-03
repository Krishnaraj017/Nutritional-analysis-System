import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:statedemo/presentation/theme/app_colors.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';

class OnboardingPageView extends StatelessWidget {
  final OnboardingData onboardingData;

  const OnboardingPageView({
    super.key,
    required this.onboardingData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 54.0, vertical: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (onboardingData.mainTitle != null) ...[ 
            GradientText(
              onboardingData.mainTitle!,
              gradient: const LinearGradient(
                colors: AppColors.gradientColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              style: Theme.of(context).textTheme.h1Bold,
              textAlign: TextAlign.center,
            ),
            const Gap(4),
          ],
          GradientText(
            onboardingData.title,
            gradient: const LinearGradient(
              colors: AppColors.gradientColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            style: Theme.of(context).textTheme.h1Medium,
            textAlign: TextAlign.center,
          ),
          const Gap(16),
          SvgPicture.asset(
            onboardingData.imagePath,
          ),
          const Gap(16),
          GradientText(
            onboardingData.subtitle,
            gradient: const LinearGradient(
              colors: AppColors.gradientColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            style: Theme.of(context).textTheme.h1Medium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class OnboardingData {
  final String? mainTitle;
  final String title;
  final String subtitle;
  final String imagePath;

  const OnboardingData({
    this.mainTitle,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });
}
