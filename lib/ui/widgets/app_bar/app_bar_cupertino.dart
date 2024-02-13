import 'package:flutter/cupertino.dart';

class AppBarCupertino {
  static PreferredSizeWidget build(
    String title,
    Widget? trailing,
  ) =>
      CupertinoNavigationBar(
        middle: Text(title),
        trailing: trailing,
      );
}
