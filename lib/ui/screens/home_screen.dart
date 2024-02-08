import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_status.dart';
import 'package:reacthome/ui/widgets/screen/screen.dart';

class HomeScreen {
  static Widget make({
    required Widget left,
    required Widget right,
  }) =>
      TitleScreen.make(
        title: 'Home',
        trailing: const DiscoveryStatus(),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [left, right],
        ),
      );
}
