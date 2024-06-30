import 'package:flutter/widgets.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/util/bus_listener.dart';

class HomeListViewModel extends GenericBusListener<HomeEvent>
    with ChangeNotifier {
  final HomeApi home;

  HomeListViewModel({
    required super.eventSource,
    required this.home,
  });

  Iterable<String> get homes => home.getAllHomes();
  String get countTitle => homes.length.toString();

  @override
  void handle(HomeEvent event) {
    switch (event) {
      case HomeAddedEvent _:
      case HomeRemovedEvent _:
        notifyListeners();
      default:
    }
  }

  @override
  void dispose() {
    cancelSubscription();
    super.dispose();
  }
}
