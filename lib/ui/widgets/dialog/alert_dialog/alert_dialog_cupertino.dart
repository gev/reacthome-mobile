import 'package:flutter/cupertino.dart';

class AlertDialogCupertino {
  static WidgetBuilder build(
    Widget? title,
    Widget? content,
    List<Widget> actions,
  ) =>
      (_) => CupertinoAlertDialog(
            title: title,
            content: content,
            actions: actions,
          );
}
