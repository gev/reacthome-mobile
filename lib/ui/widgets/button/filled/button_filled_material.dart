import 'package:flutter/material.dart';

class ButtonFilledMaterial {
  static Widget make({
    required String label,
    void Function()? onPressed,
  }) =>
      FilledButton(
        onPressed: onPressed,
        child: Text(label),
      );
}
