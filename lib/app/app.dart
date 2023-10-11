import 'package:reacthome/app/app.android.dart';
import 'package:reacthome/app/app.ios.dart';
import 'package:reacthome/app/navigation.dart';
import 'package:reacthome/domains/discovery/discovery.dart';
import 'package:reacthome/platform/platform.dart';

makeApp(
        {required Discovery discovery,
        required Navigation navigation,
        String title = 'Reacthome'}) =>
    selectPlatform(
      ios: AppIOS(discovery, navigation, title),
      android: AppAndroid(discovery, navigation, title),
    );
