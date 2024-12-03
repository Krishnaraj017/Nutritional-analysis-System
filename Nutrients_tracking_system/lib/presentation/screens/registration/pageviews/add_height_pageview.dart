import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:statedemo/domain/entities/enums.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';

import '../../../../gen/assets.gen.dart';
import '../../../cubits/registration_data_cubit/registration_data_cubit.dart';
import '../../../theme/app_colors.dart';

class AddHeightPageView extends StatefulWidget {
  const AddHeightPageView({super.key});

  @override
  State<AddHeightPageView> createState() => _AddHeightPageViewState();
}

class _AddHeightPageViewState extends State<AddHeightPageView>
    with AutomaticKeepAliveClientMixin {
  double? _height;
  HeightUnit _unit = HeightUnit.cm;
  late final FixedExtentScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _height = context.read<RegistrationDataCubit>().state.height;
    _scrollController = FixedExtentScrollController(
      initialItem: _height!.toInt() - 100,
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
          "What is your current height?",
          style: Theme.of(context).textTheme.h2Bold.apply(
                color: AppColors.primaryColor,
              ),
        ),
        const Gap(20),
        Assets.svgs.registrationHeight.svg(),
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
                    _height = value.toDouble() + 100;
                    context
                        .read<RegistrationDataCubit>()
                        .updateHeight(_height!);
                    setState(() {});
                  },
                  children: List.generate(
                    100,
                    (index) {
                      final height = index + 100;
                      final heightBasedOnUnit = height * _unit.conversionFactor;
                      return Text(
                        heightBasedOnUnit
                            .toStringAsFixed(_unit == HeightUnit.cm ? 0 : 2),
                      );
                    },
                  ),
                ),
              ),
              const Gap(20),
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 32,
                  onSelectedItemChanged: (value) {
                    _unit = HeightUnit.values[value];
                    setState(() {});
                  },
                  children:
                      HeightUnit.values.map((e) => Text(e.toString())).toList(),
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
