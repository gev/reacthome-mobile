import 'package:flutter/widgets.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/ui/app/navigation.dart';

import '../../../dto.dart';

class HomeViewModel {
  final BuildContext context;
  final Stream<HomeEvent> eventSource;
  final HomeApi home;

  HomeViewModel(
    this.context, {
    required this.eventSource,
    required this.home,
  });

  HomeUI getHome(String id) => HomeUI(
        context,
        home: home.getHomeById(id),
      );

  Stream<HomeUI> stream(String id) => eventSource
      .where((event) =>
          (event is HomeMetaChangedEvent || event is HomeProjectChangedEvent) &&
          event.home == id)
      .map((event) => getHome(id));

  void addHomeButtonPressed() {
    Navigator.pushNamed(
      context,
      NavigationRouteNames.discovery,
    );
  }

  void listHomeButtonPressed() {
    Navigator.pushNamed(
      context,
      NavigationRouteNames.homeList,
    );
  }

  void onHomeTileTap(String id, Widget confirmDialog) =>
      Navigator.pushNamedAndRemoveUntil(
        context,
        NavigationRouteNames.home,
        arguments: (home: id),
        (_) => false,
      );
}
