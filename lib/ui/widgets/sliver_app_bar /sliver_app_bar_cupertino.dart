import 'package:flutter/cupertino.dart';

class SliverAppBarCupertino {
  static WidgetBuilder build(
    String title,
    Widget? trailing,
  ) =>
      (BuildContext context) => CupertinoSliverNavigationBar(
            backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
            stretch: true,
            largeTitle: Text(title),
            trailing: trailing,
          );
}
