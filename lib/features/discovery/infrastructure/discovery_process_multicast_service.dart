import 'package:reacthome/core/discovery_process_command.dart';
import 'package:reacthome/core/discovery_process_event.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source_factory.dart';
import 'package:reacthome/util/actor.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/event_listener.dart';

class DiscoveryProcessMulticastService
    extends EventListener<DiscoveryProcessEvent> {
  final Actor<DiscoveryProcessCommand> actor;
  final MulticastSourceFactory factory;

  late MulticastSource _source;

  DiscoveryProcessMulticastService({
    required EventBus<DiscoveryProcessEvent> eventSource,
    required this.actor,
    required this.factory,
  }) : super(eventSource);

  @override
  void handle(DiscoveryProcessEvent event) async {
    switch (event) {
      case DiscoveryProcessEvent.startRequested:
        _completeStartProcess();
      case DiscoveryProcessEvent.stopRequested:
        _completeStopProcess();
      default:
    }
  }

  void _completeStartProcess() async {
    _source = await factory.create();
    actor.execute(DiscoveryProcessCommand.completeStart);
  }

  void _completeStopProcess() {
    _source.close();
    actor.execute(DiscoveryProcessCommand.completeStop);
  }

  @override
  void dispose() => _completeStopProcess();
}
