import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statedemo/domain/entities/enums.dart';
import 'package:statedemo/presentation/routes/app_router.dart';

class OptionAlertDialog extends StatefulWidget {
  final Function(MealType)? onMealTypeSelected;

  const OptionAlertDialog({
    super.key,
    this.onMealTypeSelected,
  });

  @override
  _OptionAlertDialogState createState() => _OptionAlertDialogState();
}

class _OptionAlertDialogState extends State<OptionAlertDialog> {
  bool option1Checked = false;
  bool option2Checked = false;
  bool option3Checked = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //  title: const Text('Choose an option'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CheckboxListTile(
            title: const Text('Breakfast'),
            value: option1Checked,
            onChanged: (value) {
              setState(() {
                option1Checked = value!;
                if (value) {
                  setState(() {});
                  option2Checked = false;
                  option3Checked = false;
                }
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Lunch'),
            value: option2Checked,
            onChanged: (value) {
              setState(() {
                option2Checked = value!;
                if (value) {
                  option1Checked = false;
                  option3Checked = false;
                }
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Dinner'),
            value: option3Checked,
            onChanged: (value) {
              setState(() {
                option3Checked = value!;
                if (value) {
                  option1Checked = false;
                  option2Checked = false;
                }
              });
            },
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context)
                .pop(false); // Return false when cancel is pressed
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            MealType? selectedMealType;
            if (option1Checked) {
              selectedMealType = MealType.breakfast;
            } else if (option2Checked) {
              selectedMealType = MealType.lunch;
            } else if (option3Checked) {
              selectedMealType = MealType.dinner;
            }
            if (selectedMealType != null && widget.onMealTypeSelected != null) {
              widget.onMealTypeSelected!(selectedMealType);
            }
            //Navigator.of(context).pop();
            // context.router
            //     .push(SearchMealRoute(selectedMealType: selectedMealType!));
           // context.router.push(TestRoute());
          },
          child: const Text('Confirm'),
        ),
      ],
    );
  }
}
