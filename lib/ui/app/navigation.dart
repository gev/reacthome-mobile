import 'package:flutter/widgets.dart';

class NavigationRouteNames {
  static const splash = '/';
  static const welcome = 'welcome';
  static const discovery = 'discovery';
  static const addDaemon = 'addHome';
}

class Navigation {
  final WidgetBuilder splash;
  final WidgetBuilder welcome;
  final WidgetBuilder discovery;
  final WidgetBuilder addHome;

  const Navigation({
    required this.splash,
    required this.welcome,
    required this.discovery,
    required this.addHome,
  });

  String get initialRoute => NavigationRouteNames.splash;

  Map<String, WidgetBuilder> get routes => ({
        NavigationRouteNames.splash: splash,
        NavigationRouteNames.welcome: welcome,
        NavigationRouteNames.discovery: discovery,
        NavigationRouteNames.addDaemon: addHome,
      });
}
