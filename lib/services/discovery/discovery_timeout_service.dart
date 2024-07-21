import 'package:reacthome/common/bus/bus_listener.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/util/timeout.dart';

class DiscoveryTimeoutService extends BusListener<HomeEvent> {
  final HomeApi discovered;
  final Duration timeout;

  DiscoveryTimeoutService({
    required super.eventSource,
    required this.discovered,
    required this.timeout,
  });

  final timeouts = Timeout<String>();

  @override
  void handle(HomeEvent event) {
    switch (event) {
      case HomeRenewEvent e:
        _setTimeout(e.home.id);
      case HomeRemovedEvent e:
        _cancelTimeout(e.home.id);
      default:
    }
  }

  _setTimeout(String id) => timeouts.set(
        id,
        duration: timeout,
        execute: () => discovered.removeHome(id),
      );

  _cancelTimeout(String id) => timeouts.cancel(id);
}
