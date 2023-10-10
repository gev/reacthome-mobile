import 'package:flutter/widgets.dart';
import 'package:reacthome/domains/discovery/discovery.dart';
import 'package:reacthome/screens/home/home_screen.android.dart';
import 'package:reacthome/screens/home/home_screen.ios.dart';
import 'package:reacthome/platform/platform.dart';
import 'package:reacthome/screens/home/home_screen_view_model.dart';

class HomeScreen {
  static const instance = HomeScreen._();
  const HomeScreen._();

  Widget makeView({String title = 'Home'}) => selectPlatform(
        ios: HomeScreenIOS(title: title),
        android: HomeScreenAndroid(title: title),
      );

  HomeScreenViewModel makeViewModel({required Discovery discovery}) =>
      HomeScreenViewModel(discovery: discovery);
}
