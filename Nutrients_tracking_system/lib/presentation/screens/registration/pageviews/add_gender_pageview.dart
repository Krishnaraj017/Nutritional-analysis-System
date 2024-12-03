import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:statedemo/domain/entities/enums.dart';
import 'package:statedemo/gen/assets.gen.dart';
import 'package:statedemo/presentation/cubits/registration_data_cubit/registration_data_cubit.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';
import 'package:statedemo/presentation/widgets/rosette_primary_button.dart';

import '../../../theme/app_colors.dart';

class AddGenderPageView extends HookWidget {
  const AddGenderPageView({super.key});

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    final gender =
        useState(context.read<RegistrationDataCubit>().state.gender!);
    return Column(
      children: [
        Text(
          "What is your Gender?",
          style: Theme.of(context).textTheme.h2Bold.apply(
                color: AppColors.primaryColor,
              ),
        ),
        const Gap(20),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: gender.value == Gender.male
                          ? Border.all(color: AppColors.primaryColor)
                          : null,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Assets.svgs.registrationManImage.svg(),
                  ),
                  const Gap(40),
                  Opacity(
                    opacity: gender.value == Gender.male ? 1 : 0.5,
                    child: RosettePrimaryButton(
                      onPressed: () {
                        gender.value = Gender.male;
                        context
                            .read<RegistrationDataCubit>()
                            .updateGender(gender.value);
                      },
                      child: const Text('Male'),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(20),
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: gender.value == Gender.female
                          ? Border.all(color: AppColors.primaryColor)
                          : null,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Assets.svgs.registrationFemaleImage.svg(),
                  ),
                  const Gap(40),
                  Opacity(
                    opacity: gender.value == Gender.female ? 1 : 0.5,
                    child: RosettePrimaryButton(
                      onPressed: () {
                        gender.value = Gender.female;
                        context
                            .read<RegistrationDataCubit>()
                            .updateGender(gender.value);
                      },
                      child: const Text('Female'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
