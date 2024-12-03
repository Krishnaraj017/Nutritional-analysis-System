import 'package:clock/clock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:statedemo/gen/assets.gen.dart';
import 'package:statedemo/presentation/cubits/registration_data_cubit/registration_data_cubit.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';

import '../../../theme/app_colors.dart';

class AddDobPageView extends HookWidget {
  const AddDobPageView({super.key});

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    return Column(
      children: [
        Text(
          "When can we celebrate your birthday?",
          style: Theme.of(context).textTheme.h2Bold.apply(
                color: AppColors.primaryColor,
              ),
        ),
        const Gap(20),
        Assets.svgs.registrationDob.svg(),
        const Gap(20),
        SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            initialDateTime:
                context.read<RegistrationDataCubit>().state.dateOfBirth,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (value) {
              HapticFeedback.heavyImpact();
              context.read<RegistrationDataCubit>().updateDateOfBirth(value);
            },
            maximumDate: clock.now(),
            minimumDate: DateTime(1900),
          ),
        ),
      ],
    );
  }
}
