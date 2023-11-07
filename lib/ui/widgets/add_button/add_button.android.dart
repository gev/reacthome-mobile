import 'package:flutter/material.dart';

class AddDaemonButtonAndroid extends StatelessWidget {
  final void Function()? onPressed;

  const AddDaemonButtonAndroid(this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) => FilledButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      );
}
