import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reacthome/ui_kit/theme/theme.dart';
import 'package:reacthome/ui_kit/theme/theme_material.dart';

class ThemeCupertino implements ThemeContainer {
  late final CupertinoThemeData _themeData;

  ThemeCupertino(BuildContext context) {
    _themeData = CupertinoTheme.of(context);
  }

  @override
  TextStyle? get largeTitle => _themeData.textTheme.navLargeTitleTextStyle;
}

CupertinoThemeData makeCupertinoTheme(Color seedColor, Brightness brightness) =>
    MaterialBasedCupertinoThemeData(
      materialTheme: makeMaterialTheme(
        seedColor,
        brightness,
        CupertinoThemeData(
          brightness: brightness,
          textTheme: const CupertinoTextThemeData(),
          barBackgroundColor: CupertinoColors.systemBackground,
          scaffoldBackgroundColor: CupertinoColors.systemGroupedBackground,
          applyThemeToAll: true,
        ),
      ),
    );
