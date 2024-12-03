import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:statedemo/presentation/screens/under_development/under_development_widget.dart';

@RoutePage()
class UnderDevelopmentScreen extends StatelessWidget {
  const UnderDevelopmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coming soon...'),
      ),
      body: const UnderDevelopmentWidget(),
    );
  }
}
