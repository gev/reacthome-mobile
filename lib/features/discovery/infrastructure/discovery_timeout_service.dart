import 'package:reacthome/core/discovery_event.dart';
import 'package:reacthome/features/discovery/application/discovery_service.dart';
import 'package:reacthome/infrastructure/timeout.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/bus_listener.dart';

class DiscoveryTimeoutService extends BusListener<DiscoveryEvent> {
  final DiscoveryService discovery;
  final Duration timeout;

  DiscoveryTimeoutService({
    required Bus<DiscoveryEvent> eventSource,
    required this.discovery,
    required this.timeout,
  }) : super(eventSource);

  final timeouts = Timeout<String>();

  @override
  void run(DiscoveryEvent event) {
    switch (event) {
      case DiscoveryEventDaemonAdded e:
        _start(e);
      case DiscoveryEventDaemonConfirmed e:
        _start(e);
      case DiscoveryEventDaemonRemoved e:
        _cancel(e);
    }
  }

  _start(DiscoveryEvent event) => timeouts.start(
        id: event.daemon,
        duration: timeout,
        execute: () => discovery.removeDaemon(event.daemon),
      );

  _cancel(DiscoveryEvent event) => timeouts.cancel(id: event.daemon);
}
