import 'package:reacthome/common/bus/bus_listener.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/util/timeout.dart';

class DiscoveryTimeoutService extends BusListener<HomeEvent> {
  final HomeApi homeApi;
  final Duration timeout;

  DiscoveryTimeoutService({
    required super.eventSource,
    required this.homeApi,
    required this.timeout,
  });

  final timeouts = Timeout<String>();

  @override
  void handle(HomeEvent event) {
    switch (event) {
      case HomeRenewEvent e:
        _setTimeout(e.id);
      case HomeRemovedEvent e:
        _cancelTimeout(e.id);
      default:
    }
  }

  _setTimeout(String id) => timeouts.set(
        id,
        duration: timeout,
        execute: () => homeApi.removeHome(id),
      );

  _cancelTimeout(String id) => timeouts.cancel(id);
}
