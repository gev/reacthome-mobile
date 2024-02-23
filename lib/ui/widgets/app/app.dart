import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/theme_config.dart';

typedef AppRootFactory = Widget Function({
  required String title,
  required Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates,
  required Iterable<Locale> supportedLocales,
  required ThemeConfig theme,
  required Navigation navigation,
});

typedef AppBarFactory = PreferredSizeWidget Function({
  required String title,
  Widget? trailing,
});

typedef AppBarSliverFactory = Widget Function(
  BuildContext context, {
  required String title,
  Widget? trailing,
});

typedef AppBarKnd = ({
  AppBarFactory fixed,
  AppBarSliverFactory sliver,
});

class AppContainer {
  final AppRootFactory root;
  final AppBarKnd bar;

  const AppContainer({
    required this.root,
    required this.bar,
  });
}
