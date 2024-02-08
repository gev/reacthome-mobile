import 'package:flutter/cupertino.dart';

class SwitchCupertino extends StatelessWidget {
  final bool value;
  final void Function(bool)? onChanged;

  const SwitchCupertino({
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      CupertinoSwitch(value: value, onChanged: onChanged);
}
