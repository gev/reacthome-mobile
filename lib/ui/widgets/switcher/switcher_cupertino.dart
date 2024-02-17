import 'package:flutter/cupertino.dart';

class SwitcherCupertino {
  static Widget make({
    required bool value,
    Function(bool)? onChanged,
  }) =>
      CupertinoSwitch(
        value: value,
        onChanged: onChanged,
      );
}
