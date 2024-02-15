import 'package:flutter/cupertino.dart';

class ListTileCupertino {
  static WidgetBuilder build(
    Widget title,
    Widget? subtitle,
    Widget? leading,
    Widget? trailing,
    void Function()? onTap,
  ) =>
      (_) => CupertinoListTile.notched(
            title: title,
            subtitle: subtitle,
            leading: leading,
            trailing: trailing,
            onTap: onTap,
          );
}
