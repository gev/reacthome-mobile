import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/fragments/dto.dart';
import 'package:reacthome/ui/kit/kit.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/event_listener.dart';

class DiscoveryHomeViewModel extends GenericEventListener<HomeEvent>
    with ChangeNotifier {
  final BuildContext context;
  final EventBus<HomeEvent> eventSource;
  final HomeApi discoveredHome;
  final HomeApi knownHome;

  DiscoveryHomeViewModel(
    this.context, {
    required this.eventSource,
    required this.discoveredHome,
    required this.knownHome,
  }) : super(eventSource: eventSource);

  HomeUI getHome(String id) => HomeUI(
        context,
        home: discoveredHome.getHomeById(id),
      );

  bool hasProject(String id) => discoveredHome.getHomeById(id)?.project != null;

  void addHomeButtonPressed() {
    Navigator.pushNamed(context, NavigationRouteNames.addHome);
  }

  void onHomeTileTap(
      String id, Widget confirmDialog, Widget alertDialog) async {
    final navigator = Navigator.of(context);
    final confirmed = await _confirm(confirmDialog);
    if (confirmed == true) {
      final home = discoveredHome.getHomeById(id);
      if (home != null) {
        knownHome.addHome(
          id: id,
          meta: home.meta,
          address: home.address,
          project: home.project,
        );
        navigator.pushReplacementNamed(
          NavigationRouteNames.home,
          arguments: (home: id),
        );
      } else {
        _alert(alertDialog);
      }
    }
  }

  Future<bool?> _confirm(Widget confirmDialog) => dialog.show<bool>(
        context,
        builder: (_) => ChangeNotifierProvider(
          create: (context) => DiscoveryHomeViewModel(
            context,
            eventSource: eventSource,
            discoveredHome: discoveredHome,
            knownHome: knownHome,
          ),
          child: confirmDialog,
        ),
      );

  void _alert(Widget alertDialog) => dialog.show(
        context,
        builder: (_) => alertDialog,
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
