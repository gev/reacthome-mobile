import 'package:flutter/material.dart';

class DialogActionMaterial {
  static Widget make({
    required String label,
    bool isDefaultAction = false,
    bool isDestructiveAction = false,
    void Function()? onPressed,
  }) =>
      TextButton(
        onPressed: onPressed,
        child: Text(label),
      );
}
