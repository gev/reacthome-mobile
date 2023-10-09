import 'package:flutter/widgets.dart';
import 'package:reacthome/navigation/navigation.dart';

class MainNavigation implements Navigation {
  final Widget home;

  const MainNavigation({
    required this.home,
  });

  @override
  String initialRoute() => NavigationRouteNames.home;

  @override
  Map<String, WidgetBuilder> routes() => ({
        NavigationRouteNames.home: (_) => home,
      });
}
