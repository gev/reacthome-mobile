import 'package:flutter/material.dart';

class ScaffoldMaterial {
  static WidgetBuilder build(
    PreferredSizeWidget? appBar,
    Widget body,
  ) =>
      (_) => Scaffold(
            appBar: appBar,
            body: SafeArea(
              child: body,
            ),
          );
}
