import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/core/meta.dart';
import 'package:reacthome/ui/dto/home_ui_dto.dart';

class HomeViewModel {
  final Stream<HomeEvent> eventSource;
  final HomeApi home;

  const HomeViewModel({
    required this.eventSource,
    required this.home,
  });

  HomeUiDto getHome(String id, AppLocalizations locale) => HomeUiDto(
        locale,
        home: home.getHomeById(id),
      );

  Stream<HomeUiDto> stream(String id, AppLocalizations locale) => eventSource
      .where((event) =>
          (event is HomeMetaChangedEvent || event is HomeProjectChangedEvent) &&
          event.home.id == id)
      .map((event) => getHome(id, locale));

  void addHome(String id) => home.addHome(id, meta: const Meta());

  void removeHome(String id) => home.removeHome(id);
}
