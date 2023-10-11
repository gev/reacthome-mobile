import 'package:flutter/cupertino.dart';
import 'package:reacthome/app/app_binding_observer.dart';
import 'package:reacthome/app/navigation.dart';

class AppIOS extends AppBindingObserver {
  final Navigation navigation;
  final String title;

  AppIOS(discovery, this.navigation, this.title, {super.key})
      : super(discovery);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: title,
      theme: const CupertinoThemeData(),
      initialRoute: navigation.initialRoute(),
      routes: navigation.routes(),
    );
  }
}
