import 'package:flutter/cupertino.dart';

class SwitchCupertino {
  static WidgetBuilder build(
    bool value,
    Function(bool)? onChanged,
  ) =>
      (_) => CupertinoSwitch(
            value: value,
            onChanged: onChanged,
          );
}
