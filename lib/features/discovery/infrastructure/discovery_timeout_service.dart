import 'package:reacthome/core/discovery_command.dart';
import 'package:reacthome/core/discovery_event.dart';
import 'package:reacthome/infrastructure/timeout.dart';
import 'package:reacthome/util/actor.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/event_listener.dart';

class DiscoveryTimeoutService extends EventListener<DiscoveryEvent> {
  final Actor<DiscoveryCommand> actor;
  final Duration timeout;

  DiscoveryTimeoutService({
    required EventBus<DiscoveryEvent> eventSource,
    required this.actor,
    required this.timeout,
  }) : super(eventSource);

  final timeouts = Timeout<String>();

  @override
  void handle(DiscoveryEvent event) {
    switch (event) {
      case DiscoveryEventDaemonAdded e:
        _setTimeout(e.daemon);
      case DiscoveryEventDaemonConfirmed e:
        _setTimeout(e.daemon);
      case DiscoveryEventDaemonRemoved e:
        _cancelTimeout(e.daemon);
      default:
    }
  }

  _setTimeout(String daemon) => timeouts.set(
        id: daemon,
        duration: timeout,
        execute: () => actor.execute(
          DiscoveryCommandRemoveDaemon(id: daemon),
        ),
      );

  _cancelTimeout(String daemon) => timeouts.cancel(id: daemon);
}
