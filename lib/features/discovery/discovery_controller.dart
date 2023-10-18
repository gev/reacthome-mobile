import 'package:reacthome/features/discovery/discovery_event.dart';
import 'package:reacthome/features/discovery/discovery_service.dart';
import 'package:reacthome/features/discovery/discovery_state.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/bus_transfer.dart';
import 'package:reacthome/util/closable.dart';
import 'package:reacthome/util/factory.dart';

class DiscoveryController extends BusTransfer<DiscoveryEvent, DiscoveryState> {
  final DiscoveryService service;
  final AsyncFactory<Closable> factory;

  Closable? _discoverySource;

  DiscoveryController(
    this.service, {
    required Bus<DiscoveryEvent> eventSource,
    required Bus<DiscoveryState> commandSink,
    required this.factory,
  }) : super(source: eventSource, sink: commandSink);

  @override
  void run(DiscoveryEvent event) {
    switch (event) {
      case DiscoveryEvent.start:
        _start();
      case DiscoveryEvent.run:
        _run();
      case DiscoveryEvent.stop:
        _stop();
    }
  }

  void _start() async {
    emit(DiscoveryState.starting);
    _discoverySource = await factory.create();
    service.run();
  }

  void _run() {
    emit(DiscoveryState.running);
  }

  void _stop() {
    _discoverySource?.close();
    emit(DiscoveryState.stopped);
  }

  @override
  void dispose() => _stop();
}

class EventBus {}
