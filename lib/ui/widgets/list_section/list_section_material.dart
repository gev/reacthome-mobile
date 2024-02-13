import 'package:flutter/material.dart';

class ListSectionMaterial {
  static WidgetBuilder build(
    String? title,
    List<Widget> children,
  ) =>
      (_) => (title != null)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListSectionTitleMaterial(title),
                ListSectionCardMaterial(children),
              ],
            )
          : ListSectionCardMaterial(children);
}

class ListSectionCardMaterial extends StatelessWidget {
  final List<Widget> children;

  const ListSectionCardMaterial(this.children, {super.key});

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: Column(
          children: ListTile.divideTiles(
            context: context,
            tiles: children,
          ).toList(),
        ),
      ));
}

class ListSectionTitleMaterial extends StatelessWidget {
  final String title;

  const ListSectionTitleMaterial(this.title, {super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 4),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
}
