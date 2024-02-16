import 'package:flutter/material.dart';

class ListTileMaterial {
  static WidgetBuilder build(
    Widget title,
    Widget? subtitle,
    Widget? leading,
    Widget? trailing,
    void Function()? onTap,
  ) =>
      (_) => ListTile(
            title: title,
            subtitle: subtitle,
            leading: leading,
            trailing: trailing,
            onTap: onTap,
            visualDensity: VisualDensity.compact,
          );
}
