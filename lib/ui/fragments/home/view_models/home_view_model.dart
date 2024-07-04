import 'package:flutter/widgets.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/util/bus_listener.dart';

import '../../../dto.dart';

class HomeViewModel extends GenericBusListener<HomeEvent> with ChangeNotifier {
  final BuildContext context;
  final Stream<HomeEvent> eventSource;
  final HomeApi home;

  HomeViewModel(
    this.context, {
    required this.eventSource,
    required this.home,
  }) : super(eventSource: eventSource);

  HomeUI getHome(String id) => HomeUI(
        context,
        home: home.getHomeById(id),
      );

  void addHomeButtonPressed() {
    Navigator.pushNamed(context, NavigationRouteNames.discovery);
  }

  void onHomeTileTap(String id, Widget confirmDialog) => Navigator.pushNamed(
        context,
        NavigationRouteNames.home,
        arguments: (home: id),
      );

  @override
  void handle(HomeEvent event) {
    switch (event) {
      case HomeMetaChangedEvent _:
      case HomeProjectChangedEvent _:
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
