import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/ui/dto.dart';

class DiscoveryHomeViewModel {
  final Stream<HomeEvent> eventSource;
  final HomeApi discoveredHome;
  final HomeApi knownHome;

  DiscoveryHomeViewModel({
    required this.eventSource,
    required this.discoveredHome,
    required this.knownHome,
  });

  HomeUI home(String id, AppLocalizations locale) => HomeUI(
        locale,
        home: discoveredHome.getHomeById(id),
      );

  Stream<HomeUI> stream(String id, AppLocalizations locale) => eventSource
      .where((event) =>
          event.home == id &&
          (event is HomeMetaChangedEvent || event is HomeProjectChangedEvent))
      .map((event) => home(id, locale));

  bool addHome(String id) {
    final home = discoveredHome.getHomeById(id);
    if (home == null) {
      return false;
    }
    knownHome.addHome(
      id: id,
      meta: home.meta,
      address: home.address,
      project: home.project,
    );
    return true;
  }
}
