import 'package:flutter/widgets.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/infrastructure/bus/bus_listener.dart';

class HomeListViewModel extends BusListener<HomeEvent> with ChangeNotifier {
  final HomeApi home;

  HomeListViewModel({
    required super.eventSource,
    required this.home,
  });

  Iterable<String> get homes => home.getAllHomesId();

  @override
  void handle(HomeEvent event) {
    switch (event) {
      case HomeAddedEvent _:
      case HomeRemovedEvent _:
        notifyListeners();
      default:
    }
  }
}
