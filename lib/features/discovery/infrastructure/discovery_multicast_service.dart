import 'package:reacthome/core/discovery/discovery_command.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source_factory.dart';
import 'package:reacthome/util/event_listener.dart';

class DiscoveryMulticastService extends EventListener<DiscoveryEvent> {
  final DiscoveryCommand actor;
  final MulticastSourceFactory factory;

  MulticastSource? _source;

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
      case DiscoveryEventStartCompleted<MulticastSource> e:
        _source = e.source;
      case DiscoveryEventRejected<MulticastSource> e:
        e.source.close();
      case DiscoveryEventStopRequested _:
        _completeStopProcess();
      default:
    }
  }

  void _completeStartProcess() async {
    final source = await factory.create();
    actor.completeStart(source);
  }

  void _completeStopProcess() {
    _source?.close();
    actor.completeStop();
  }

  @override
  void dispose() => _completeStopProcess();
}
