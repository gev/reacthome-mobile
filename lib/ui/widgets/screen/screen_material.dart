import 'package:flutter/material.dart';

class ScreenMaterial {
  static WidgetBuilder build(Widget body) =>
      (_) => Scaffold(body: SafeArea(child: body));
}

class TitleScreenMaterial {
  static WidgetBuilder build(
    String title,
    Widget body,
    Widget? trailing,
  ) =>
      (_) => Scaffold(
            appBar: AppBar(
              title: Text(title),
              actions: trailing != null ? [trailing] : [],
            ),
            body: SafeArea(
              child: body,
            ),
          );
}
