import 'package:flutter/material.dart';

class SwitchMaterial extends StatelessWidget {
  final bool value;
  final void Function(bool)? onChanged;

  const SwitchMaterial({
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      Switch(value: value, onChanged: onChanged);
}
