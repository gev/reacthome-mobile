import 'package:flutter/widgets.dart';

class NavigationRouteNames {
  static const home = '/';
}

class Navigation {
  final Widget home;

  const Navigation({required this.home});

  String get initialRoute => NavigationRouteNames.home;

  Map<String, WidgetBuilder> get routes => ({
        NavigationRouteNames.home: (_) => home,
      });
}
