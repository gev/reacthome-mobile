import 'package:flutter/cupertino.dart';

class ButtonFilledCupertino {
  static Widget make({
    required String label,
    void Function()? onPressed,
  }) =>
      CupertinoButton.filled(
        onPressed: onPressed,
        child: Text(label),
      );
}
