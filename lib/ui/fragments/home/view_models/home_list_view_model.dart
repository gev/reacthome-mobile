import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';

class HomeListViewModel {
  final Stream<HomeEvent> eventSource;
  final HomeApi home;

  HomeListViewModel({
    required this.eventSource,
    required this.home,
  });

  Iterable<String> get homes => home.getAllHomes();

  Stream<Iterable<String>> get stream => eventSource
      .where((event) => event is HomeAddedEvent || event is HomeRemovedEvent)
      .map((event) => homes);
}
