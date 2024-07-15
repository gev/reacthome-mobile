import 'package:flutter/cupertino.dart';

class ScaffoldCupertino {
  static Widget make({
    PreferredSizeWidget? appBar,
    required Widget body,
  }) =>
      CupertinoPageScaffold(
        navigationBar: appBar as ObstructingPreferredSizeWidget?,
        child: body,
      );
}
