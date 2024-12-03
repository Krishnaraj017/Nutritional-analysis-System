import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:statedemo/presentation/screens/under_development/under_development_widget.dart';

@RoutePage()
class MyHealthPage extends StatelessWidget {
  const MyHealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return UnderDevelopmentWidget();
  }
}
