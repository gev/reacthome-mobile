import 'package:flutter/material.dart';

class ListTileMaterial {
  static Widget make({
    required Widget title,
    Widget? subtitle,
    Widget? leading,
    Widget? trailing,
    void Function()? onTap,
  }) =>
      ListTile(
        title: title,
        subtitle: subtitle,
        leading: leading,
        trailing: trailing,
        onTap: onTap,
        visualDensity: VisualDensity.comfortable,
      );
}
