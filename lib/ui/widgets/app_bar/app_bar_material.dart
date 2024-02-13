import 'package:flutter/material.dart';

class AppBarMaterial {
  static PreferredSizeWidget build(
    String title,
    Widget? trailing,
  ) =>
      AppBar(
        title: Text(title),
        actions: trailing != null ? [trailing] : [],
      );
}
