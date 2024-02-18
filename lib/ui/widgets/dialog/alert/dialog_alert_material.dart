import 'package:flutter/material.dart';

class AlertDialogMaterial {
  static void make(
    BuildContext context, {
    Widget? title,
    Widget? content,
    required List<Widget> actions,
  }) =>
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: title,
          content: content,
          actions: actions,
        ),
      );
}
