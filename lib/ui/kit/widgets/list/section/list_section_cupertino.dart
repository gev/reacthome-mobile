import 'package:flutter/cupertino.dart';

class ListSectionCupertino {
  static Widget make(
    BuildContext context, {
    String? title,
    required List<Widget> children,
    bool hasLeading = false,
  }) =>
      title != null
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
