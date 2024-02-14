import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/widgets/sliver_app_bar%20/sliver_app_bar_cupertino.dart';
import 'package:reacthome/ui/widgets/sliver_app_bar%20/sliver_app_bar_material.dart';
import 'package:reacthome/util/platform.dart';

class SliverAppBar extends PlatformWidget {
  SliverAppBar({
    required String title,
    Widget? trailing,
    super.key,
  }) : super(
          cupertino: SliverAppBarCupertino.build(title, trailing),
          material: SliverAppBarMaterial.build(title, trailing),
        );
}
