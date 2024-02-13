import 'package:flutter/cupertino.dart';

class ListTileCupertino {
  static WidgetBuilder build(
    String title,
    Widget? trailing,
  ) =>
      (_) => CupertinoListTile(
            title: Text(title),
            trailing: trailing,
          );
}
