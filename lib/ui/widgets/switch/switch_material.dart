import 'package:flutter/material.dart';

class SwitchMaterial {
  static WidgetBuilder build(
    bool value,
    Function(bool)? onChanged,
  ) =>
      (_) => Switch(
            value: value,
            onChanged: onChanged,
          );
}
