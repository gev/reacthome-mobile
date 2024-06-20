import 'package:flutter/material.dart';

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
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ),
        actions: trailing != null ? [trailing] : [],
      );
}
