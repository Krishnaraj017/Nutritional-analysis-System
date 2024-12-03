import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:statedemo/data/models/hydration.dart';
import 'package:statedemo/presentation/screens/hydration/widgets/hydration_log.dart';
import 'package:statedemo/presentation/theme/app_colors.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';

class HydrationWeeklyProgressWidget extends StatefulWidget {
  final Map<DateTime, Hydration> weeklyHydrations;

  const HydrationWeeklyProgressWidget({
    super.key,
    required this.weeklyHydrations,
  });

  @override
  State<HydrationWeeklyProgressWidget> createState() =>
      _HydrationWeeklyProgressWidgetState();
}

class _HydrationWeeklyProgressWidgetState
    extends State<HydrationWeeklyProgressWidget> {
  DateTime _selectedDate = DateUtils.dateOnly(clock.now());

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _moveToEnd();
    });
  }

  void _moveToEnd() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Your Weekly Progress',
              style: Theme.of(context).textTheme.regularSemiBold,
            ),
            const Gap(10),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.weeklyHydrations.length,
                controller: _scrollController,
                itemBuilder: (context, index) {
                  final date = widget.weeklyHydrations.keys.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ChoiceChip(
                      selectedColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      label: Text(
                        DateFormat.E().format(date),
                        style: Theme.of(context).textTheme.regularSmall.apply(
                              color: _selectedDate == date
                                  ? Colors.white
                                  : Colors.black,
                            ),
                      ),
                      selected: _selectedDate == date,
                      onSelected: (value) {
                        setState(() {
                          _selectedDate = date;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            const Gap(10),
            HydrationLogWidget(
              hydration: widget.weeklyHydrations[_selectedDate]!,
            ).animate(key: ValueKey(_selectedDate)).fadeIn(),
          ],
        ),
      ),
    );
  }
}
