import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/widgets/app_bar/app_bar_cupertino.dart';
import 'package:reacthome/ui/widgets/app_bar/app_bar_material.dart';
import 'package:reacthome/util/platform.dart';

class AppBar {
  static PreferredSizeWidget build({
    required String title,
    Widget? trailing,
  }) =>
      selectPlatform(
        cupertino: AppBarCupertino.build,
        material: AppBarMaterial.build,
      )(title, trailing);
}
