import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:statedemo/domain/entities/enums.dart';
import 'package:statedemo/presentation/cubits/registration_data_cubit/registration_data_cubit.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';

import '../../../../gen/assets.gen.dart';
import '../../../theme/app_colors.dart';

class AddWeightPageView extends StatefulWidget {
  const AddWeightPageView({super.key});

  @override
  State<AddWeightPageView> createState() => _AddWeightPageViewState();
}

class _AddWeightPageViewState extends State<AddWeightPageView>
    with AutomaticKeepAliveClientMixin {
  double? _weight;
  WeightUnit _unit = WeightUnit.kg;
  late final FixedExtentScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _weight = context.read<RegistrationDataCubit>().state.weight;
    _scrollController = FixedExtentScrollController(
      initialItem: _weight!.toInt() - 30,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Text(
          "What is your current weight?",
          style: Theme.of(context).textTheme.h2Bold.apply(
                color: AppColors.primaryColor,
              ),
        ),
        const Gap(20),
        Assets.svgs.registrationWeight.svg(),
        const Gap(20),
        SizedBox(
          height: 200,
          child: Row(
            children: [
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 32,
                  scrollController: _scrollController,
                  onSelectedItemChanged: (value) {
                    HapticFeedback.heavyImpact();
                    _weight = value + 30.0;
                    context
                        .read<RegistrationDataCubit>()
                        .updateWeight(_weight!);
                    setState(() {});
                  },
                  children: List.generate(
                    100,
                    (index) {
                      final weight = index + 30;
                      final weightBasedOnUnit = weight * _unit.conversionFactor;
                      return Text(weightBasedOnUnit.toStringAsFixed(0));
                    },
                  ),
                ),
              ),
              const Gap(20),
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 32,
                  onSelectedItemChanged: (value) {
                    HapticFeedback.heavyImpact();
                    _unit = WeightUnit.values[value];
                    setState(() {});
                  },
                  children:
                      WeightUnit.values.map((e) => Text(e.toString())).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
