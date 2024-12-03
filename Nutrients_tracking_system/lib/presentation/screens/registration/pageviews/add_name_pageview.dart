import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:statedemo/gen/assets.gen.dart';
import 'package:statedemo/presentation/cubits/registration_data_cubit/registration_data_cubit.dart';
import 'package:statedemo/presentation/theme/app_colors.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';
import 'package:statedemo/utils/validators/validators.dart';

class AddNamePageView extends HookWidget {
  const AddNamePageView({super.key});

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    final nameController = useTextEditingController();
    return Column(
      children: [
        Text(
          "Let's get to know you better",
          style: Theme.of(context).textTheme.h2Bold.apply(
                color: AppColors.primaryColor,
              ),
        ),
        const Gap(20),
        Assets.svgs.userProfile.svg(),
        const Gap(20),
        Text(
          'How can we address you?',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Gap(20),
        TextFormField(
          controller: nameController,
          textCapitalization: TextCapitalization.words,
          inputFormatters: [
            LengthLimitingTextInputFormatter(30),
            FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]')),
            FilteringTextInputFormatter.deny(RegExp('[ ]{2,}')),
            FilteringTextInputFormatter.deny(RegExp('^[ ]')),
          ],
          validator: (value) => Validators.emptyValidator(
            value,
            message: 'Please enter the name',
          ),
          onSaved: (newValue) {
            if (newValue == null) return;
            context.read<RegistrationDataCubit>().updateName(newValue);
          },
        ),
      ],
    );
  }
}
