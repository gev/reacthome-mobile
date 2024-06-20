import 'package:flutter/cupertino.dart';
import 'package:reacthome/ui/kit/theme/theme.dart';

class ThemeCupertino implements ThemeContainer {
  late final CupertinoThemeData _themeData;
  ThemeCupertino(BuildContext context) {
    _themeData = CupertinoTheme.of(context);
  }

  @override
  TextStyle? get largeTitle => _themeData.textTheme.navLargeTitleTextStyle;
}
