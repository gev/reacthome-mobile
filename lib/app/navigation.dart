import 'package:flutter/widgets.dart';

class NavigationRouteNames {
  static const home = '/';
}

class Navigation {
  final Widget home;

  const Navigation({required this.home});

  String initialRoute() => NavigationRouteNames.home;

  Map<String, WidgetBuilder> routes() => ({
        NavigationRouteNames.home: (_) => home,
      });
}
