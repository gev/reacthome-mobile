import 'package:flutter/cupertino.dart';

class DialogActionCupertino {
  static WidgetBuilder build(
    String label,
    bool isDefaultAction,
    bool isDestructiveAction,
    void Function()? onPressed,
  ) =>
      (_) => CupertinoDialogAction(
            onPressed: onPressed,
            isDefaultAction: isDefaultAction,
            isDestructiveAction: isDestructiveAction,
            child: Text(label),
          );
}
