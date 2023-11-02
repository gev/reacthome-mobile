import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/screens/home/home_screen_add_button_view.android.dart';
import 'package:reacthome/ui/screens/home/home_screen_add_button_view.ios.dart';
import 'package:reacthome/util/platform.dart';

Widget addButton() => selectPlatform(
      ios: const AddDaemonButtonIOS(),
      android: const AddDaemonButtonAndroid(),
    );
