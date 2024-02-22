import 'package:reacthome/core/app_lifecycle/app_lifecycle_event.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home_connection/home_connection_api.dart';
import 'package:reacthome/util/event_listener.dart';

class HomeConnectionLifecycleService
    extends GenericEventListener<AppLifecycleEvent> {
  final HomeApi home;
  final HomeConnectionApi connection;

  HomeConnectionLifecycleService({
    required super.eventSource,
    required this.home,
    required this.connection,
  });

  @override
  void handle(AppLifecycleEvent event) {
    switch (event) {
      case AppLifecycleEvent.active:
        connection
            .connectAll(home.getAllHomes().map((id) => home.getHomeById(id)!));
      case AppLifecycleEvent.inactive:
        connection.disconnectAll();
    }
  }
}
