import 'package:flutter/cupertino.dart';

class ScaffoldCupertino {
  static WidgetBuilder build(
    PreferredSizeWidget? appBar,
    Widget body,
  ) =>
      (_) => CupertinoPageScaffold(
            navigationBar: appBar as ObstructingPreferredSizeWidget?,
            child: body,
          );
}
