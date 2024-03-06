import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/kit/kit.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/event_listener.dart';

import '../../../dto.dart';

class HomeViewModel extends GenericEventListener<HomeEvent>
    with ChangeNotifier {
  final BuildContext context;
  final EventBus<HomeEvent> eventSource;
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

  Future<bool?> _confirm(Widget confirmDialog) => dialog.show<bool>(
        context,
        builder: (_) => ChangeNotifierProvider(
          create: (context) => HomeViewModel(
            context,
            eventSource: eventSource,
            home: home,
          ),
          child: confirmDialog,
        ),
      );

  @override
  void handle(HomeEvent event) {
    switch (event) {
      case HomeAddedEvent _:
      case HomeMetaChangedEvent _:
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
