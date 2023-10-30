import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:reacthome/core/discovery/discovery_command.dart';
import 'package:reacthome/core/meta.dart';
import 'package:uuid/uuid.dart';

class HomeScreenAddButtonViewModel with ChangeNotifier {
  final DiscoveryCommand discovery;

  HomeScreenAddButtonViewModel(this.discovery);

  int _index = 0;
  final _uuid = const Uuid();

  void addDaemonButtonPressed() {
    discovery.addDaemon(
      id: _uuid.v4(),
      meta: Meta(title: 'Daemon $_index', code: 'D $_index'),
      address: InternetAddress.anyIPv4,
    );
    _index++;
  }
}
