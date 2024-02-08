import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_status.dart';
import 'package:reacthome/ui/widgets/screen/screen.dart';

class DiscoveryScreen {
  static Widget make({
    required Widget discoveryPanel,
  }) =>
      TitleScreen.make(
        title: 'Discovery',
        trailing: const DiscoveryStatus(),
        body: discoveryPanel,
      );
}
