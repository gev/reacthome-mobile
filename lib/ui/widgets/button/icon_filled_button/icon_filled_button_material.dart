import 'package:flutter/material.dart';

class IconFilledButtonMaterial {
  static WidgetBuilder build(
    String label,
    IconData icon,
    void Function()? onPressed,
  ) =>
      (_) => FilledButton.icon(
            onPressed: onPressed,
            icon: Icon(icon),
            label: Text(label),
          );
}
