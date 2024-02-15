import 'package:flutter/cupertino.dart';

class ListSectionCupertino {
  static WidgetBuilder build(
          String? title, List<Widget> children, bool hasLeading) =>
      (_) => title != null
          ? CupertinoListSection.insetGrouped(
              hasLeading: hasLeading,
              header: Text(title),
              children: children,
            )
          : CupertinoListSection(
              hasLeading: hasLeading,
              children: children,
            );
}
