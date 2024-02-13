import 'package:flutter/cupertino.dart';

class FilledButtonCupertino {
  static WidgetBuilder build(
    String label,
    void Function()? onPressed,
  ) =>
      (_) => CupertinoButton.filled(
            onPressed: onPressed,
            child: Text(label),
          );
}
