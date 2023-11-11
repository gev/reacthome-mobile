import 'package:reacthome/core/discovery/discovery_command.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source_factory.dart';
import 'package:reacthome/util/event_listener.dart';

class DiscoveryMulticastService extends EventListener<DiscoveryEvent> {
  final DiscoveryCommand<MulticastSource> actor;
  final MulticastSourceFactory factory;

  DiscoveryMulticastService({
    required super.eventSource,
    required this.actor,
    required this.factory,
  });

  @override
  void handle(DiscoveryEvent event) async {
    switch (event) {
      case DiscoveryEventStartRequested _:
        _completeStartProcess();
      case DiscoveryEventRejected<MulticastSource> e:
        _reject(e.source);
      case DiscoveryEventStopRequested<MulticastSource> e:
        _completeStopProcess(e.source);
      default:
    }
  }

  void _completeStartProcess() async {
    final source = await factory.create();
    actor.completeStart(source);
  }

  void _reject(MulticastSource source) {
    source.close();
  }

  void _completeStopProcess(MulticastSource source) {
    source.close();
    actor.completeStop();
  }
}
