import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:reacthome/core/discovery_command.dart';
import 'package:reacthome/core/discovery_event.dart';
import 'package:reacthome/core/meta.dart';
import 'package:reacthome/util/actor.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/event_listener.dart';
import 'package:reacthome/util/handler.dart';
import 'package:uuid/uuid.dart';

class HomeScreenViewModel extends EventListener<DiscoveryEvent>
    with ChangeNotifier {
  final (Actor<DiscoveryCommand>, Handler<DiscoveryEvent>) discovery;

  HomeScreenViewModel(this.discovery,
      {required EventBus<DiscoveryEvent> eventSource})
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
    discovery.execute(
      DiscoveryCommandAddDaemon(
        id: _uuid.v4(),
        meta: Meta(
            title: 'Daemon ${daemons.length + 1}',
            code: 'D ${daemons.length + 1}'),
        address: InternetAddress.anyIPv4,
      ),
    );
  }

  @override
  void handle(DiscoveryEvent event) {
    switch (event) {
      case DiscoveryEventDaemonAdded _:
      case DiscoveryEventDaemonRemoved _:
      case DiscoveryEventDaemonMetaChanged _:
        notifyListeners();
      default:
    }
  }
}
