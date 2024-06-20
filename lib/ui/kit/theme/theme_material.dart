import 'package:flutter/material.dart';
import 'package:reacthome/ui/kit/theme/theme.dart';

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
