import 'package:flutter/cupertino.dart';

class FilledButtonCupertino extends StatelessWidget {
  final void Function()? onPressed;
  final String label;

  const FilledButtonCupertino(this.label, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) => CupertinoButton.filled(
        onPressed: onPressed,
        child: Text(label),
      );
}
