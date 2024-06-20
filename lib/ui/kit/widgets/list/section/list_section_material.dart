import 'package:flutter/material.dart';

class ListSectionMaterial {
  static Widget make(
    BuildContext context, {
    String? title,
    required List<Widget> children,
    bool hasLeading = false,
  }) =>
      (title != null)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListSectionTitleMaterial(title),
                ListSectionCardMaterial.withTitle(children),
              ],
            )
          : Column(
              children: ListTile.divideTiles(
                context: context,
                tiles: children,
              ).toList(),
            );
}

class ListSectionCardMaterial extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry padding;

  const ListSectionCardMaterial(this.children, {super.key})
      : padding = const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12);

  const ListSectionCardMaterial.withTitle(this.children, {super.key})
      : padding = const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 16);

  @override
  Widget build(BuildContext context) => Padding(
      padding: padding,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
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
        padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
}
