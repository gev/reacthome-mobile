import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/kit/theme/theme.dart';
import 'package:reacthome/ui/kit/theme/theme_cupertino.dart';
import 'package:reacthome/ui/kit/theme/theme_material.dart';
import 'package:reacthome/util/platform.dart';

class Theme {
  Theme._();

  static ThemeContainer of(BuildContext context) => selectPlatform(
        cupertino: ThemeCupertino(context),
        material: ThemeMaterial(context),
      );
}
