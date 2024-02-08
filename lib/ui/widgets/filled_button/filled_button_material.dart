import 'package:flutter/material.dart';

class FilledButtonMaterial extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  const FilledButtonMaterial(this.label, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) => FilledButton(
        onPressed: onPressed,
        child: Text(label),
      );
}
