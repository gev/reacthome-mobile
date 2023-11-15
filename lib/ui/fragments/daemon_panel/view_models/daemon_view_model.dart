import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:reacthome/core/daemon/daemon_command.dart';
import 'package:reacthome/core/meta.dart';
import 'package:uuid/uuid.dart';

class DaemonViewModel with ChangeNotifier {
  final DaemonCommand discovery;

  DaemonViewModel(this.discovery);

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