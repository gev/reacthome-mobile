import 'package:flutter/cupertino.dart';

class AppBarFixedCupertino {
  static PreferredSizeWidget make({
    required String title,
    Widget? trailing,
  }) =>
      CupertinoNavigationBar(
        middle: Text(title),
        trailing: trailing,
      );
}
