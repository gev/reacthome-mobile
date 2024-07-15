import 'package:flutter/cupertino.dart';

class DialogActionCupertino {
  static Widget make({
    required String label,
    bool isDefaultAction = false,
    bool isDestructiveAction = false,
    void Function()? onPressed,
  }) =>
      CupertinoDialogAction(
        onPressed: onPressed,
        isDefaultAction: isDefaultAction,
        isDestructiveAction: isDestructiveAction,
        child: Text(label),
      );
}
