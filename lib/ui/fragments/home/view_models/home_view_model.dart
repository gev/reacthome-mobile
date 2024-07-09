import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/ui/dto.dart';

class HomeViewModel {
  final Stream<HomeEvent> eventSource;
  final HomeApi home;

  HomeViewModel({
    required this.eventSource,
    required this.home,
  });

  HomeUI getHome(String id, AppLocalizations locale) => HomeUI(
        locale,
        home: home.getHomeById(id),
      );

  Stream<HomeUI> stream(String id, AppLocalizations locale) => eventSource
      .where((event) =>
          (event is HomeMetaChangedEvent || event is HomeProjectChangedEvent) &&
          event.home == id)
      .map((event) => getHome(id, locale));
}
