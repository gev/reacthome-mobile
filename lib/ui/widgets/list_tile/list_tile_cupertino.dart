import 'package:flutter/cupertino.dart';

class ListTileCupertino {
  static WidgetBuilder build(
    String title,
    Widget? leading,
    Widget? trailing,
    void Function()? onTap,
  ) =>
      (_) => CupertinoListTile.notched(
            title: Text(title),
            leading: leading,
            trailing: trailing,
            onTap: onTap,
          );
}
