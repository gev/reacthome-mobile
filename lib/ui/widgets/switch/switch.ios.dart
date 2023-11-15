import 'package:flutter/cupertino.dart';

class SwitchIOS extends StatelessWidget {
  final bool value;
  final void Function(bool)? onChanged;

  const SwitchIOS({
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      CupertinoSwitch(value: value, onChanged: onChanged);
}
