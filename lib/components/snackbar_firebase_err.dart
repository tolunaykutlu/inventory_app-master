import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showExceptions(
    BuildContext context, String error) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(error),
    ),
  );
}
