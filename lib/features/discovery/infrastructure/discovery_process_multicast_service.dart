import 'package:reacthome/core/discovery_process_event.dart';
import 'package:reacthome/features/discovery/application/discovery_process_service.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source_factory.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/bus_listener.dart';

class DiscoveryProcessMulticastService
    extends BusListener<DiscoveryProcessEvent> {
  final DiscoveryProcessService process;
  final MulticastSourceFactory factory;

  late MulticastSource _source;

  DiscoveryProcessMulticastService({
    required Bus<DiscoveryProcessEvent> eventSource,
    required this.process,
    required this.factory,
  }) : super(eventSource);

  @override
  void run(DiscoveryProcessEvent event) async {
    switch (event) {
      case DiscoveryProcessEvent.startRequested:
        _start();
      case DiscoveryProcessEvent.stopRequested:
        _stop();
      default:
    }
  }

  void _start() async {
    _source = await factory.create();
    process.completeStart();
  }

  void _stop() {
    _source.close();
    process.completeStop();
  }

  @override
  void dispose() => _stop();
}
