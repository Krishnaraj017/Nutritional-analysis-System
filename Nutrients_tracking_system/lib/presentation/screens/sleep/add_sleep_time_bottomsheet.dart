import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:statedemo/data/models/sleep.dart';
import 'package:statedemo/di/get_it.dart';
import 'package:statedemo/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:statedemo/presentation/cubits/sleep_cubit/sleep_cubit.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';
import 'package:time_range_picker/time_range_picker.dart';

@RoutePage()
class AddSleepTimeScreen extends StatefulWidget implements AutoRouteWrapper {
  final Sleep? sleep;

  const AddSleepTimeScreen({super.key, this.sleep});

  @override
  State<AddSleepTimeScreen> createState() => _AddSleepTimeScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SleepCubit>(),
      child: this,
    );
  }
}

class _AddSleepTimeScreenState extends State<AddSleepTimeScreen> {
  late TimeOfDay _startTime;
  late TimeOfDay _endTime;

  @override
  void initState() {
    super.initState();
    _startTime = widget.sleep?.sleepLog?.sleepStartTimeOfDay ??
        context.read<AuthCubit>().state.user!.bedTime;
    _endTime = widget.sleep?.sleepLog?.sleepEndTimeOfDay ??
        context.read<AuthCubit>().state.user!.wakeUpTime;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${widget.sleep == null ? 'Add' : 'Edit'} Sleep Time',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Gap(20),
          SizedBox(
            height: 350,
            child: Stack(
              fit: StackFit.expand,
              children: [
                TimeRangePicker(
                  onStartChange: (startTime) =>
                      setState(() => _startTime = startTime),
                  onEndChange: (endTime) => setState(() => _endTime = endTime),
                  start: _startTime,
                  end: _endTime,
                  hideButtons: true,
                  labelOffset: -30,
                  clockRotation: 180,
                  labels: List.generate(12, (index) {
                    final hour = index * 2;
                    return ClockLabel.fromTime(
                      time: TimeOfDay(hour: hour, minute: 0),
                      text: '${hour % 6 == 0 ? hour : '|'}',
                    );
                  }),
                  hideTimes: true,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '$startTimeIn12hourFormat\n$endTimeIn12hourFormat',
                    style: Theme.of(context).textTheme.title,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const Gap(20),
          Text(
            '${sleepDuration.inHours} hours ${sleepDuration.inMinutes.remainder(60)} minutes',
            style: Theme.of(context).textTheme.regularSmall,
            textAlign: TextAlign.center,
          ),
          const Gap(20),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    context.router.pop();
                  },
                  child: const Text('Cancel'),
                ),
              ),
              const Gap(20),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    context.read<SleepCubit>().updateSleepDuration(
                          sleepStartTime: _startTime,
                          sleepEndTime: _endTime,
                        );
                    context.router.pop();
                  },
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Duration get sleepDuration {
    //time is based on 24 hour clock
    final startTime = _startTime.hour * 60 + _startTime.minute;
    final endTime = _endTime.hour * 60 + _endTime.minute;

    if (endTime < startTime) {
      return Duration(minutes: (endTime + 24 * 60) - startTime);
    } else {
      return Duration(minutes: endTime - startTime);
    }
  }

  String get startTimeIn12hourFormat {
    final hour = _startTime.hourOfPeriod;
    //if minute is less than 10, add a 0 before it
    final minute = _startTime.minute < 10
        ? '0${_startTime.minute}'
        : _startTime.minute.toString();
    final period = _startTime.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  String get endTimeIn12hourFormat {
    final hour = _endTime.hourOfPeriod;
    //if minute is less than 10, add a 0 before it
    final minute = _endTime.minute < 10
        ? '0${_endTime.minute}'
        : _endTime.minute.toString();
    final period = _endTime.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }
}
