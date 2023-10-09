import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/features/discovery/discovery.dart';
import 'package:reacthome/features/home/home.android.dart';
import 'package:reacthome/features/home/home.ios.dart';
import 'package:reacthome/features/home/home_view_model.dart';

class HomeFactory {
  static const instance = HomeFactory._();
  const HomeFactory._();

  Widget makeHomePage({required Discovery discovery, String title = 'Home'}) {
    final homePage = Platform.isIOS || Platform.isMacOS
        ? HomePageIOS(title: title)
        : HomePageAndroid(title: title);
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(discovery),
      child: homePage,
    );
  }
}
