import 'package:flutter/cupertino.dart';

class ListSectionCupertino extends StatelessWidget {
  final String? title;
  final List<Widget> children;

  const ListSectionCupertino(this.title, this.children, {super.key});

  @override
  Widget build(BuildContext context) => CupertinoListSection.insetGrouped(
        header: title != null ? Text(title!) : null,
        children: children,
      );
}
