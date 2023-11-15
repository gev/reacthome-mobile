import 'package:reacthome/ui/widgets/switch/switch.android.dart';
import 'package:reacthome/ui/widgets/switch/switch.ios.dart';
import 'package:reacthome/util/platform.dart';

switcher({
  required bool value,
  required void Function(bool)? onChanged,
}) =>
    selectPlatform(
      ios: () => SwitchIOS(value: value, onChanged: onChanged),
      android: () => SwitchAndroid(value: value, onChanged: onChanged),
    );
