import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:statedemo/data/models/reminders.dart';
import 'package:statedemo/presentation/cubits/reminder_cubit/reminders_cubit.dart';
import 'package:statedemo/presentation/theme/app_colors.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';

class ReminderTile extends StatefulWidget {
  final Reminder reminder;
  const ReminderTile({super.key, required this.reminder});

  @override
  State<ReminderTile> createState() => _ReminderTileState();
}

class _ReminderTileState extends State<ReminderTile> {
  bool isCecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MSHCheckbox(
          size: 22,
          value: widget.reminder.isComplete,
          colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
            checkedColor: AppColors.primaryColor,
          ),
          style: MSHCheckboxStyle.stroke,
          onChanged: (value) {
            setState(() {
              context
                  .read<RemindersCubit>()
                  .switchIsComplete(date: widget.reminder.date);
            });
          },
        ),
        const Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.reminder.title.toString(),style: Theme.of(context).textTheme.regularSmallSemiBold,),
                Text(DateFormat('dd/MM/yy hh:mm a').format(widget.reminder.date),style: Theme.of(context).textTheme.regularSmall),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
