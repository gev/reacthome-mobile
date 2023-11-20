import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/widgets/add_button/add_button.android.dart';
import 'package:reacthome/ui/widgets/add_button/add_button.ios.dart';
import 'package:reacthome/util/platform.dart';

class AddButton {
  static Widget make({void Function()? onPressed}) => selectPlatform(
        ios: () => AddDaemonButtonIOS(onPressed),
        android: () => AddDaemonButtonAndroid(onPressed),
      );
}
