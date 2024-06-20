import 'package:flutter/cupertino.dart';

class AppBarSliverCupertino {
  static Widget make(
    BuildContext context, {
    required String title,
    Widget? trailing,
  }) =>
      CupertinoSliverNavigationBar(
        backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
        stretch: true,
        largeTitle: Text(title),
        trailing: trailing,
      );
}
