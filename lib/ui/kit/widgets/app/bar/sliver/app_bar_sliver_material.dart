import 'package:flutter/material.dart';
import 'package:reacthome/ui/kit/layout/layout_material.dart';

class AppBarSliverMaterial {
  static Widget make(
    BuildContext context, {
    required String title,
    Widget? trailing,
  }) =>
      SliverAppBar.medium(
        pinned: true,
        stretch: true,
        title: Text(title),
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Container(
            alignment: AlignmentDirectional.bottomStart,
            padding: layout.padding.edgeInsets,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ),
        actions: trailing != null ? [trailing] : [],
      );
}
