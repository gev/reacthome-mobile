import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reacthome/ui/kit/theme/theme.dart';
import 'package:reacthome/ui/kit/theme/theme_material.dart';

class ThemeCupertino implements ThemeContainer {
  late final CupertinoThemeData _themeData;
  ThemeCupertino(BuildContext context) {
    _themeData = CupertinoTheme.of(context);
  }

  @override
  TextStyle? get largeTitle => _themeData.textTheme.navLargeTitleTextStyle;
}

ThemeData makeCupertinoTheme(Color seedColor, Brightness brightness) =>
    makeMaterialTheme(
      seedColor,
      brightness,
      CupertinoThemeData(
          brightness: brightness,
          textTheme: const CupertinoTextThemeData(),
          barBackgroundColor: CupertinoColors.systemBackground,
          scaffoldBackgroundColor: CupertinoColors.systemBackground,
          applyThemeToAll: true),
    );
