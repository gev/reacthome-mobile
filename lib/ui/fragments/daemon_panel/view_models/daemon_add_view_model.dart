import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:reacthome/core/daemon/daemon_command.dart';
import 'package:reacthome/core/meta.dart';
import 'package:uuid/uuid.dart';

class DaemonAddViewModel with ChangeNotifier {
  final DaemonCommand actor;

  DaemonAddViewModel({required this.actor});

  int _index = 0;
  final _uuid = const Uuid();

  void addDaemonButtonPressed() {
    actor.addDaemon(
      id: _uuid.v4(),
      meta: Meta(title: 'Daemon $_index', code: 'D $_index'),
      address: InternetAddress.anyIPv4,
    );
    _index++;
  }
}
