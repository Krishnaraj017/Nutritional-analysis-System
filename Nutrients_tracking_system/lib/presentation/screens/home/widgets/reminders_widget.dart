import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statedemo/presentation/cubits/reminder_cubit/reminders_cubit.dart';
import 'package:statedemo/presentation/cubits/reminder_cubit/reminders_state.dart';
import 'package:statedemo/presentation/screens/home/widgets/add_reminder_dialogbox.dart';
import 'package:statedemo/presentation/screens/home/widgets/reminder_tile.dart';
import 'package:statedemo/presentation/theme/app_colors.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';

import '../../../widgets/custom_loader.dart';

class RemindersWidget extends StatefulWidget {
  const RemindersWidget({super.key});

  @override
  State<RemindersWidget> createState() => _RemindersWidgetState();
}

class _RemindersWidgetState extends State<RemindersWidget> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 140,
      child: DecoratedBox(
        decoration: Theme.of(context).rosetteCardDecoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Quick reminders",
                    style: textTheme.regularSemiBold
                        .apply(color: const Color(0xFF575153)),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 8,
                      child: BlocBuilder<RemindersCubit, RemindersState>(
                        builder: (context, state) {
                          if (state is RemindersLoading) {
                            return const Center(
                              child: CustomLoader(),
                            );
                          } else if (state is RemindersError) {
                            return Center(
                              child: Text(state.errorMessage.toString()),
                            );
                          } else if (state is RemindcersLoaded) {
                            final reminders = state.reminders;
                            if (reminders.isEmpty) {
                              return const Center(child: Text("Add Reminders"));
                            } else {
                              return ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: reminders.length,
                                itemBuilder: (context, index) {
                                  return ReminderTile(
                                      reminder: reminders[index]);
                                },
                              );
                            }
                          } else {
                            return const Center(
                              child: Text("Unexpected error "),
                            );
                          }
                        },
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: AppColors.gradientColors,
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: () {
                              showDialog<void>(
                                context: context,
                                builder: (_) =>
                                    BlocProvider<RemindersCubit>.value(
                                  value: context.read<RemindersCubit>(),
                                  child: const AddReminderDialogbox(),
                                ),
                              );
                            },
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
