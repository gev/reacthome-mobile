import 'package:flutter/cupertino.dart';

class AlertDialogCupertino {
  static Widget make({
    Widget? title,
    Widget? content,
    required List<Widget> actions,
  }) =>
      CupertinoAlertDialog(
        title: title,
        content: content,
        actions: actions,
      );
}
