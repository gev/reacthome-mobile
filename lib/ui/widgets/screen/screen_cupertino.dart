import 'package:flutter/cupertino.dart';

class ScreenCupertino {
  static WidgetBuilder build(Widget body) =>
      (_) => CupertinoPageScaffold(child: SafeArea(child: body));
}

class TitleScreenCupertino {
  static WidgetBuilder build(
    String title,
    Widget body,
    Widget? trailing,
  ) =>
      (_) => CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(title),
              trailing: trailing,
            ),
            child: SafeArea(
              child: body,
            ),
          );
}
