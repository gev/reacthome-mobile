import 'package:flutter/material.dart';

class ListTileMaterial {
  static WidgetBuilder build(
    String title,
    String? subtitle,
    Widget? leading,
    Widget? trailing,
    void Function()? onTap,
  ) =>
      (_) => ListTile(
            title: Text(title),
            subtitle: subtitle != null ? Text(subtitle) : null,
            leading: leading,
            trailing: trailing,
            onTap: onTap,
          );
}
