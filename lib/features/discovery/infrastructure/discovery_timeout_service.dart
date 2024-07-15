import 'package:reacthome/core/home/home.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/infrastructure/bus/bus_listener.dart';
import 'package:reacthome/infrastructure/timeout.dart';

class DiscoveryTimeoutService extends BusListener<HomeEvent> {
  final HomeApi actor;
  final Duration timeout;

  DiscoveryTimeoutService({
    required super.eventSource,
    required this.actor,
    required this.timeout,
  });

  final timeouts = Timeout<String>();

  @override
  void handle(HomeEvent event) {
    switch (event) {
      case HomeRenewEvent e:
        _setTimeout(e.home);
      case HomeRemovedEvent e:
        _cancelTimeout(e.home);
      default:
    }
  }

  _setTimeout(Home home) => timeouts.set(
        id: home.id,
        duration: timeout,
        execute: () => actor.removeHome(id: home.id),
      );

  _cancelTimeout(Home home) => timeouts.cancel(id: home.id);
}
