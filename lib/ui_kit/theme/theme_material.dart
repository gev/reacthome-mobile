import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reacthome/ui_kit/theme/theme.dart';

TextStyle? largeTitleMaterial(BuildContext context) =>
    Theme.of(context).textTheme.headlineLarge;

class ThemeMaterial implements ThemeContainer {
  late final ThemeData _themeData;

  ThemeMaterial(BuildContext context) {
    _themeData = Theme.of(context);
  }

  @override
  TextStyle? get largeTitle => _themeData.textTheme.headlineLarge;
}

ThemeData makeMaterialTheme(Color seedColor, Brightness brightness,
        [NoDefaultCupertinoThemeData? cupertinoOverrideTheme]) =>
    ThemeData(
      colorScheme: ColorScheme.fromSeed(
        brightness: brightness,
        seedColor: seedColor,
        dynamicSchemeVariant: DynamicSchemeVariant.vibrant,
      ),
      cupertinoOverrideTheme: cupertinoOverrideTheme,
    );
