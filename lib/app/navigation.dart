import 'package:flutter/widgets.dart';

class NavigationRouteNames {
  static const home = '/';
}

class Navigation {
  final initialRoute = NavigationRouteNames.home;
  final Widget home;

  Navigation({
    required this.home,
  });

  Map<String, WidgetBuilder> routes() => ({
        NavigationRouteNames.home: (_) => home,
      });
}
