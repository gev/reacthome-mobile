import 'package:flutter/material.dart';

class ListTileMaterial {
  static WidgetBuilder build(
    String title,
    Widget? trailing,
  ) =>
      (_) => ListTile(
            title: Text(title),
            trailing: trailing,
          );
}
