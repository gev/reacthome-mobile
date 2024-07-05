import 'package:flutter/widgets.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/dto.dart';
import 'package:reacthome/ui/kit/kit.dart';

class DiscoveryHomeViewModel {
  final BuildContext context;
  final Stream<HomeEvent> eventSource;
  final HomeApi discoveredHome;
  final HomeApi knownHome;

  DiscoveryHomeViewModel(
    this.context, {
    required this.eventSource,
    required this.discoveredHome,
    required this.knownHome,
  });

  HomeUI home(String id) => HomeUI(
        context,
        home: discoveredHome.getHomeById(id),
      );

  Stream<HomeUI> stream(String id) => eventSource
      .where((event) =>
          (event is HomeMetaChangedEvent || event is HomeProjectChangedEvent) &&
          event.home == id)
      .map((event) => home(id));

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
        builder: (_) => confirmDialog,
      );

  void _alert(Widget alertDialog) => dialog.show(
        context,
        builder: (_) => alertDialog,
      );
}
