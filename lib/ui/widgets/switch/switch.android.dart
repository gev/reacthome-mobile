import 'package:flutter/material.dart';

class SwitchAndroid extends StatelessWidget {
  final bool value;
  final void Function(bool)? onChanged;

  const SwitchAndroid({
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      Switch(value: value, onChanged: onChanged);
}
