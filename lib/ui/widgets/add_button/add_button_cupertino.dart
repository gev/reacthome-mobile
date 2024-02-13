import 'package:flutter/cupertino.dart';

class AddButtonCupertino {
  static WidgetBuilder build(void Function()? onPressed) =>
      (_) => CupertinoButton.filled(
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
