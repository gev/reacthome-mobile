import 'package:reacthome/common/view_model.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';

class HomeListViewModel extends ViewModel<HomeEvent> {
  final HomeApi home;

  HomeListViewModel({
    required super.eventSource,
    required this.home,
  });

  Iterable<String> get homes => home.getAllHomesId();

  @override
  bool shouldNotify(HomeEvent event) =>
      event is HomeAddedEvent || event is HomeRemovedEvent;
}
