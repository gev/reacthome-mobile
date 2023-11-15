import 'package:reacthome/core/daemon/daemon_command.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/infrastructure/timeout.dart';
import 'package:reacthome/util/event_listener.dart';

class DiscoveryTimeoutService extends EventListener<DaemonEvent> {
  final DaemonCommand actor;
  final Duration timeout;

  DiscoveryTimeoutService({
    required super.eventSource,
    required this.actor,
    required this.timeout,
  });

  final timeouts = Timeout<String>();

  @override
  void handle(DaemonEvent event) {
    switch (event) {
      case DaemonAddedEvent e:
        _setTimeout(e.daemon);
      case DaemonConfirmedEvent e:
        _setTimeout(e.daemon);
      case DaemonRemovedEvent e:
        _cancelTimeout(e.daemon);
      default:
    }
  }

  _setTimeout(String daemon) => timeouts.set(
        id: daemon,
        duration: timeout,
        execute: () => actor.removeDaemon(id: daemon),
      );

  _cancelTimeout(String daemon) => timeouts.cancel(id: daemon);
}
