import 'package:flutter/cupertino.dart';

class AppBarCupertino {
  static PreferredSizeWidget make({
    required String title,
    Widget? trailing,
  }) =>
      CupertinoNavigationBar(
        middle: Text(title),
        trailing: trailing,
      );
}
