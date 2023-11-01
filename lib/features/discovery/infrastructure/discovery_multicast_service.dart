import 'package:reacthome/core/discovery/discovery_command.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source_factory.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/event_listener.dart';

class DiscoveryMulticastService extends EventListener<DiscoveryEvent> {
  final DiscoveryCommand actor;
  final MulticastSourceFactory factory;

  late MulticastSource _source;

  DiscoveryMulticastService({
    required EventBus<DiscoveryEvent> eventSource,
    required this.actor,
    required this.factory,
  }) : super(eventSource);

  @override
  void handle(DiscoveryEvent event) async {
    switch (event) {
      case DiscoveryEvent.startRequested:
        _completeStartProcess();
      case DiscoveryEvent.stopRequested:
        _completeStopProcess();
      default:
    }
  }

  void _completeStartProcess() async {
    _source = await factory.create();
    actor.completeStart();
  }

  void _completeStopProcess() {
    _source.close();
    actor.completeStop();
  }

  @override
  void dispose() => _completeStopProcess();
}
