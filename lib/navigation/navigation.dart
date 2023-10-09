import 'package:flutter/widgets.dart';

class NavigationRouteNames {
  static const home = '/';
}

abstract interface class Navigation {
  String initialRoute();
  Map<String, WidgetBuilder> routes();
}
