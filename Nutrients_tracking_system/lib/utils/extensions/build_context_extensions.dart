import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:statedemo/domain/entities/app_error.dart';

extension BuildContextExtensions on BuildContext {
  /// Show or hide loading overlay based on [isLoading] value.
  void handleLoading(bool isLoading, {Widget? widget}) {
    if (isLoading) {
      loaderOverlay.show(widgetBuilder: widget != null ? (_) => widget : null);
    } else {
      loaderOverlay.hide();
    }
  }

  void displaySuccessMessage({required String message}) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.green,
        ),
      );
  }

  void displayError({required AppError error}) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Something went wrong!'),
          backgroundColor: Colors.red,
        ),
      );
  }

  void displayErrorMessage({required String message}) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );
  }
}
