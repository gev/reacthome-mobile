import 'package:flutter/cupertino.dart';

class ListTileCupertino {
  static Widget make({
    required Widget title,
    Widget? subtitle,
    Widget? leading,
    Widget? trailing,
    void Function()? onTap,
  }) =>
      CupertinoListTile.notched(
        title: title,
        subtitle: subtitle,
        leading: leading,
        trailing: trailing,
        onTap: onTap,
      );
}
