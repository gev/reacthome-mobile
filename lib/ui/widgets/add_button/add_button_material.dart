import 'package:flutter/material.dart';

class AddButtonMaterial {
  static WidgetBuilder build(void Function()? onPressed) =>
      (_) => FilledButton.icon(
            onPressed: onPressed,
            icon: const Icon(Icons.add),
            label: const Text('Add'),
          );
}
