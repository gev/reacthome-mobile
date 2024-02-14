import 'package:flutter/cupertino.dart';

class ListSectionCupertino {
  static WidgetBuilder build(
    String? title,
    List<Widget> children,
  ) =>
      (_) => title != null
          ? CupertinoListSection.insetGrouped(
              hasLeading: false,
              header: Text(title),
              children: children,
            )
          : CupertinoListSection(
              hasLeading: false,
              children: children,
            );
}
