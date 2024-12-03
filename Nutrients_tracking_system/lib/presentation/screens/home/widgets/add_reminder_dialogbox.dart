import 'package:auto_route/auto_route.dart';
import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:statedemo/presentation/cubits/reminder_cubit/reminders_cubit.dart';
import 'package:statedemo/presentation/theme/app_colors.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';
import 'package:statedemo/utils/app_utils.dart';

class AddReminderDialogbox extends StatefulWidget {
  const AddReminderDialogbox({
    super.key,
  });

  @override
  State<AddReminderDialogbox> createState() => _AddReminderDialogboxState();
}

class _AddReminderDialogboxState extends State<AddReminderDialogbox> {
  @override
  Widget build(BuildContext context) {
    DateTime time = clock.now();
    String? title;
    return AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Quick Reminders",
                  style: Theme.of(context)
                      .textTheme
                      .h3Medium
                      .apply(color: AppColors.gray1),
                ),
              ),
              const Gap(20),
              TextField(
                decoration: const InputDecoration().copyWith(
                  hintText: "Task to get reminded",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  hintStyle: const TextStyle(
                    color: AppColors.gray2,
                    fontSize: 13,
                  ),
                ),
                onChanged: (value) {
                  title = value;
                },
              ),
              const Gap(20),
              GestureDetector(
                onTap: () async {
                  DateTime? chosenTime = await showOmniDateTimePicker(
                    context: context,
                    initialDate: time,
                    firstDate:
                        DateTime(1600).subtract(const Duration(days: 3652)),
                    lastDate: clock.now().add(
                          const Duration(days: 3652),
                        ),
                    is24HourMode: false,
                    isShowSeconds: false,
                    minutesInterval: 1,
                    secondsInterval: 1,
                    isForce2Digits: true,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    constraints: const BoxConstraints(
                      maxWidth: 350,
                      maxHeight: 650,
                    ),
                    transitionBuilder: (context, anim1, anim2, child) {
                      return FadeTransition(
                        opacity: anim1.drive(
                          Tween(
                            begin: 0,
                            end: 1,
                          ),
                        ),
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 200),
                    barrierDismissible: true,
                  );
                  setState(() {
                    time = chosenTime ?? time;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.scaffoldBackgroundColor,
                    border: Border.all(),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      DateFormat("DD-MM-yyyy   hh:mm a").format(time),
                      style:
                          const TextStyle(fontSize: 13, color: AppColors.gray3),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      contentPadding: const EdgeInsets.only(right: 12, left: 12, top: 15),
      actions: [
        TextButton(
          onPressed: () {
            context.popRoute();
          },
          child: const Text(
            "Cancel",
            style: TextStyle(fontSize: 18),
          ),
        ),
        TextButton(
          onPressed: () {
            if (title != null && time != clock.now()) {
              context.read<RemindersCubit>().addReminder(
                    date: AppUtils.getDateAndTime(time: time),
                    title: title!,
                  );
            }
            context.popRoute();
          },
          child: const Text(
            "Save",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
      actionsAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
