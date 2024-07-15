import 'package:flutter/cupertino.dart';

class ButtonIconFilledCupertino {
  static Widget make({
    required String label,
    required IconData icon,
    Function()? onPressed,
  }) =>
      CupertinoButton.filled(
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
