import 'package:flutter/material.dart';

class SwitcherMaterial {
  static Widget make({
    required bool value,
    Function(bool)? onChanged,
  }) =>
      Switch(
        value: value,
        onChanged: onChanged,
      );
}
