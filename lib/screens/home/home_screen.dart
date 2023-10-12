import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/domains/discovery/discovery_data_provider.dart';
import 'package:reacthome/screens/home/home_screen_view.android.dart';
import 'package:reacthome/screens/home/home_screen_view.ios.dart';
import 'package:reacthome/platform/platform.dart';
import 'package:reacthome/screens/home/home_screen_view_model.dart';

Widget makeHomeScreen(
        {required DiscoveryDataProvider discovery, String title = 'Home'}) =>
    ChangeNotifierProvider(
      create: (_) => HomeScreenViewModel(discovery),
      child: selectPlatform(
        ios: HomeScreenViewIOS(title: title),
        android: HomeScreenViewAndroid(title: title),
      ),
    );
