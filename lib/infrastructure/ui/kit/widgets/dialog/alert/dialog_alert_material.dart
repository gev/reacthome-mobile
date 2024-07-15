import 'package:flutter/material.dart';

class AlertDialogMaterial {
  static Widget make({
    Widget? title,
    Widget? content,
    required List<Widget> actions,
  }) =>
      AlertDialog(
        title: title,
        content: content,
        actions: actions,
      );
}
