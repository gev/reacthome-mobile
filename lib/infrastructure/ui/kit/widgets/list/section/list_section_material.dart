import 'package:flutter/material.dart';
import 'package:reacthome/infrastructure/ui/kit/layout/layout_material.dart';

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
          : layout.padding.fullWidth(
              child: Card(
                shape: const ContinuousRectangleBorder(),
                margin: EdgeInsets.zero,
                child: Column(
                  children: ListTile.divideTiles(
                    context: context,
                    tiles: children,
                  ).toList(),
                ),
              ),
            );
}

class ListSectionCardMaterial extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry padding;

  ListSectionCardMaterial(this.children, {super.key})
      : padding = layout.padding.edgeInsets;

  ListSectionCardMaterial.withTitle(this.children, {super.key})
      : padding = EdgeInsetsDirectional.fromSTEB(
          layout.padding.start,
          4,
          layout.padding.end,
          layout.padding.bottom,
        );

  @override
  Widget build(BuildContext context) => Padding(
      padding: padding,
      child: Card(
        margin: EdgeInsets.zero,
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
        padding: EdgeInsetsDirectional.fromSTEB(
          layout.padding.start,
          layout.padding.top,
          layout.padding.end,
          0,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
}
