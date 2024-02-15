import 'package:flutter/cupertino.dart';

class ListTileCupertino {
  static WidgetBuilder build(
    String title,
    String? subtitle,
    Widget? leading,
    Widget? trailing,
    void Function()? onTap,
  ) =>
      (_) => CupertinoListTile.notched(
            title: Text(title),
            subtitle: subtitle != null ? Text(subtitle) : null,
            leading: leading,
            trailing: trailing,
            onTap: onTap,
          );
}
