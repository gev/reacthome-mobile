import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/infrastructure/timeout.dart';
import 'package:reacthome/util/event_listener.dart';

class DiscoveryTimeoutService extends GenericEventListener<HomeEvent> {
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
      case HomeAddedEvent e:
        _setTimeout(e.home);
      case HomeConfirmedEvent e:
        _setTimeout(e.home);
      case HomeRemovedEvent e:
        _cancelTimeout(e.home);
      default:
    }
  }

  _setTimeout(String home) => timeouts.set(
        id: home,
        duration: timeout,
        execute: () => actor.removeHome(id: home),
      );

  _cancelTimeout(String home) => timeouts.cancel(id: home);
}
