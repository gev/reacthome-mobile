import 'package:reacthome/features/discovery_process/application/discovery_process_service.dart';
import 'package:reacthome/features/discovery_process/domain/discovery_process_event.dart';
import 'package:reacthome/features/discovery_process/domain/discovery_process_state.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/bus_transfer.dart';
import 'package:reacthome/util/closable.dart';
import 'package:reacthome/util/factory.dart';

class DiscoveryProcessController
    extends BusTransfer<DiscoveryProcessEvent, DiscoveryProcessState> {
  final DiscoveryProcessService service;
  final AsyncFactory<Closable> factory;

  Closable? _discoverySource;

  DiscoveryProcessController(
    this.service, {
    required Bus<DiscoveryProcessEvent> eventSource,
    required Bus<DiscoveryProcessState> commandSink,
    required this.factory,
  }) : super(source: eventSource, sink: commandSink);

  @override
  void run(DiscoveryProcessEvent event) {
    switch (event) {
      case DiscoveryProcessEvent.start:
        _start();
      case DiscoveryProcessEvent.run:
        _run();
      case DiscoveryProcessEvent.stop:
        _stop();
    }
  }

  void _start() async {
    emit(DiscoveryProcessState.starting);
    _discoverySource = await factory.create();
    service.run();
  }

  void _run() {
    emit(DiscoveryProcessState.running);
  }

  void _stop() {
    _discoverySource?.close();
    emit(DiscoveryProcessState.stopped);
  }

  @override
  void dispose() => _stop();
}

class EventBus {}
