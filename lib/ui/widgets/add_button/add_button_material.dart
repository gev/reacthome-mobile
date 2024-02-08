import 'package:flutter/material.dart';

class AddButtonMaterial extends StatelessWidget {
  final void Function()? onPressed;

  const AddButtonMaterial(this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) => FilledButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      );
}
