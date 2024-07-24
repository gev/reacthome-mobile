import 'package:reacthome/common/bus/bus_listener.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/core/preferences/preferences_api.dart';

class MyHomeService extends BusListener<HomeEvent> {
  final PreferencesApi preferencesApi;

  MyHomeService({
    required super.eventSource,
    required this.preferencesApi,
  });

  @override
  void handle(HomeEvent event) {
    if (event is HomeRemovedEvent && preferencesApi.home == event.id) {
      preferencesApi.removeHome(event.id);
    }
  }
}
