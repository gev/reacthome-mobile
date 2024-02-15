import 'package:flutter/material.dart';

class FilledButtonMaterial {
  static WidgetBuilder build(
    String label,
    void Function()? onPressed,
  ) =>
      (_) => FilledButton(
            onPressed: onPressed,
            child: Text(label),
          );
}
