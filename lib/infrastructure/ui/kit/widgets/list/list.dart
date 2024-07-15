import 'package:flutter/widgets.dart';

typedef ListChevronFactory = Widget Function();

typedef ListTileFactory = Widget Function({
  required Widget title,
  Widget? subtitle,
  Widget? leading,
  Widget? trailing,
  void Function()? onTap,
});

typedef ListSectionFactory = Widget Function(
  BuildContext context, {
  String? title,
  required List<Widget> children,
  bool hasLeading,
});

class ListContainer {
  final ListSectionFactory section;
  final ListTileFactory tile;
  final ListChevronFactory chevron;

  const ListContainer({
    required this.section,
    required this.tile,
    required this.chevron,
  });
}
