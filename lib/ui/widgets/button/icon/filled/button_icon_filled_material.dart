import 'package:flutter/material.dart';

class ButtonIconFilledMaterial {
  static Widget make({
    required String label,
    required IconData icon,
    Function()? onPressed,
  }) =>
      FilledButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
      );
}
