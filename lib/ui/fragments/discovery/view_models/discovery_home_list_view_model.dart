import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/util/replay_latest_stream.dart';

class DiscoveryHomeListViewModel {
  final Stream<HomeEvent> eventSource;
  final HomeApi home;

  DiscoveryHomeListViewModel({
    required this.eventSource,
    required this.home,
  });

  Iterable<String> get homes => home.getAllHomes();

  Stream<Iterable<String>> get stream => eventSource
      .where((event) => event is HomeAddedEvent || event is HomeRemovedEvent)
      .map((event) => homes)
      .replayLatest(homes);
}
