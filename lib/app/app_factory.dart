import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:reacthome/app/app.android.dart';
import 'package:reacthome/app/app.ios.dart';
import 'package:reacthome/features/discovery/discovery.dart';

class AppFactory {
  static const instance = AppFactory._();
  const AppFactory._();

  Widget makeApp({required Discovery discovery, required Widget home}) {
    final app = Platform.isIOS || Platform.isMacOS
        ? AppIOS(discovery: discovery, home: home)
        : AppAndroid(discovery: discovery, home: home);
    return app;
  }
}
