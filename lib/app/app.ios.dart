import 'package:flutter/cupertino.dart';
import 'package:reacthome/app/app_binding_observer.dart';
import 'package:reacthome/app/navigation.dart';

class AppIOS extends AppBindingObserver {
  final Navigation navigation;

  AppIOS(discovery, this.navigation, {super.key}) : super(discovery);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Reacthome',
      theme: const CupertinoThemeData(),
      initialRoute: navigation.initialRoute(),
      routes: navigation.routes(),
    );
  }
}
