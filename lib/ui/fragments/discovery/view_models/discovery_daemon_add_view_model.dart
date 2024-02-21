import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/app/navigation.dart';

class DiscoveryDaemonAddViewModel {
  final BuildContext context;

  DiscoveryDaemonAddViewModel(this.context);

  void addDaemonButtonPressed() {
    Navigator.of(context).pushNamed(NavigationRouteNames.addDaemon);
  }
}
