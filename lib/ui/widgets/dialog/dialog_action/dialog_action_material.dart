import 'package:flutter/material.dart';

class DialogActionMaterial {
  static WidgetBuilder build(
    String label,
    void Function()? onPressed,
  ) =>
      (_) => TextButton(
            onPressed: onPressed,
            child: Text(label),
          );
}
