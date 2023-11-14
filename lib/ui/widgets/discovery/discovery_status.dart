import 'package:reacthome/ui/widgets/discovery/discovery_status.android.dart';
import 'package:reacthome/ui/widgets/discovery/discovery_status.ios.dart';
import 'package:reacthome/util/platform.dart';

discoveryStatus({
  required bool value,
  required void Function(bool)? onChanged,
}) =>
    selectPlatform(
      ios: () => DiscoveryStatusIOS(value: value, onChanged: onChanged),
      android: () => DiscoveryStatusAndroid(value: value, onChanged: onChanged),
    );
