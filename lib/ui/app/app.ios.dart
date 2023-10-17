import 'package:flutter/cupertino.dart';
import 'package:reacthome/ui/app/app_binding_observer.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/theme_config.dart';

class AppIOS extends AppBindingObserver {
  final ThemeConfig theme;
  final Navigation navigation;
  final String title;

  AppIOS(this.theme, this.navigation, this.title, discovery, {super.key})
      : super(discovery);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: title,
      theme: CupertinoThemeData(primaryColor: theme.primaryColor),
      initialRoute: navigation.initialRoute,
      routes: navigation.routes,
    );
  }
}