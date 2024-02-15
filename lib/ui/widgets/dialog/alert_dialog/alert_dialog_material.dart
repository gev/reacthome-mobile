import 'package:flutter/material.dart';

class AlertDialogMaterial {
  static WidgetBuilder build(
    Widget? title,
    Widget? content,
    List<Widget> actions,
  ) =>
      (_) => AlertDialog(
            title: title,
            content: content,
            actions: actions,
          );
}
