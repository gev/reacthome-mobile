import 'package:flutter/widgets.dart';

typedef SwitcherFactory = Widget Function({
  required bool value,
  void Function(bool)? onChanged,
});
