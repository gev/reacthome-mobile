import 'package:flutter/cupertino.dart';

class IconFilledButtonCupertino {
  static WidgetBuilder build(
    String label,
    IconData icon,
    Function()? onPressed,
  ) =>
      (_) => CupertinoButton.filled(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            onPressed: onPressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 28),
                const SizedBox(width: 8),
                Text(label),
              ],
            ),
          );
}
