import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/navigation.dart';

typedef AppRootFactory = Widget Function(
  BuildContext context, {
  required String title,
  required Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates,
  required Iterable<Locale> supportedLocales,
  required Navigation navigation,
  required Color seedColor,
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

typedef AppBarKind = ({
  AppBarFactory fixed,
  AppBarSliverFactory sliver,
});

class AppContainer {
  final AppRootFactory root;
  final AppBarKind bar;

  const AppContainer({
    required this.root,
    required this.bar,
  });
}
