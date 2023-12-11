import 'package:flutter/cupertino.dart';

class AddButtonIOS extends StatelessWidget {
  final void Function()? onPressed;

  const AddButtonIOS(this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) => CupertinoButton.filled(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
        onPressed: onPressed,
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(CupertinoIcons.add, size: 28),
            SizedBox(width: 8),
            Text('Add'),
          ],
        ),
      );
}
