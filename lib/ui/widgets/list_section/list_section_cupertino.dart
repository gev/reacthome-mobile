import 'package:flutter/cupertino.dart';

class ListSectionCupertino {
  static WidgetBuilder build(
    String? title,
    List<Widget> children,
  ) =>
      (_) => CupertinoListSection.insetGrouped(
            header: title != null ? Text(title) : null,
            children: children,
          );
}
