import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/domains/discovery/discovery.dart';
import 'package:reacthome/screens/home/home_screen.android.dart';
import 'package:reacthome/screens/home/home_screen.ios.dart';
import 'package:reacthome/platform/platform.dart';
import 'package:reacthome/screens/home/home_screen_view_model.dart';

Widget makeHomeScreen({required Discovery discovery, String title = 'Home'}) =>
    ChangeNotifierProvider(
      create: (_) => HomeScreenViewModel(discovery),
      child: selectPlatform(
        ios: HomeScreenIOS(title: title),
        android: HomeScreenAndroid(title: title),
      ),
    );
