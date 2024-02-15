import 'package:flutter/material.dart';

class ListTileMaterial {
  static WidgetBuilder build(
    String title,
    Widget? leading,
    Widget? trailing,
    void Function()? onTap,
  ) =>
      (_) => ListTile(
            title: Text(title),
            leading: leading,
            trailing: trailing,
            onTap: onTap,
          );
}
