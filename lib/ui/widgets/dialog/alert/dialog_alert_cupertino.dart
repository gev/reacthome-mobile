import 'package:flutter/cupertino.dart';

class AlertDialogCupertino {
  static void make(
    BuildContext context, {
    Widget? title,
    Widget? content,
    required List<Widget> actions,
  }) =>
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: title,
          content: content,
          actions: actions,
        ),
      );
}
