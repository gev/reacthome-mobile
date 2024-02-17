import 'package:flutter/material.dart';

class AppBarMaterial {
  static PreferredSizeWidget make({
    required String title,
    Widget? trailing,
  }) =>
      AppBar(
        title: Text(title),
        actions: trailing != null ? [trailing] : [],
      );
}
