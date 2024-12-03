import 'package:flutter/material.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';

class WorkWidget extends StatelessWidget {
  const WorkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: Theme.of(context).rosetteCardDecoration,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Text(
                'Work',
                maxLines: 1,
                style: Theme.of(context).textTheme.regularSmall.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const Icon(
              Icons.watch,
              size: 20,
            ),
          ]),
        )
      ]),
    );
  }
}
