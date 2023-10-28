import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:reacthome/core/discovery_event.dart';
import 'package:reacthome/core/meta.dart';
import 'package:reacthome/features/discovery/application/discovery_service.dart';
import 'package:reacthome/features/discovery/domain/discovery_daemon.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/bus_listener.dart';
import 'package:reacthome/util/extensions.dart';
import 'package:uuid/uuid.dart';

class HomeScreenViewModel extends BusListener<DiscoveryEvent>
    with ChangeNotifier {
  final DiscoveryService discovery;

  HomeScreenViewModel(this.discovery,
      {required Bus<DiscoveryEvent> eventSource})
      : super(eventSource);

  Iterable<String> get daemons => discovery.getAllDaemons();
  String get numberTitle => daemons.length.toString();

  String getDaemonTitleById(String id) {
    final daemon = discovery.getDaemonById(id);
    final title = [];
    if (daemon != null) {
      daemon.meta.title?.let(title.add);
      daemon.meta.code?.let(title.add);
    }
    if (title.isEmpty) {
      title.add(id);
    }
    return title.join(' / ');
  }

  final _uuid = const Uuid();

  void addDaemonButtonPressed() {
    discovery.addDaemon(
      _uuid.v4(),
      DiscoveryDaemon(
        meta: Meta(
            title: 'Daemon ${daemons.length + 1}',
            code: 'D ${daemons.length + 1}'),
        address: InternetAddress.anyIPv4,
      ),
    );
  }

  @override
  void run(DiscoveryEvent event) {
    switch (event) {
      case DiscoveryEventDaemonAdded _:
      case DiscoveryEventDaemonRemoved _:
      case DiscoveryEventDaemonChanged _:
        notifyListeners();
      default:
    }
  }
}
