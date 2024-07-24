import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/common/view_model.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/core/meta/meta.dart';
import 'package:reacthome/core/preferences/preferences_api.dart';
import 'package:reacthome/ui/dto/home_ui_dto.dart';

class HomesViewModel {
  final Stream<HomeEvent> eventSource;
  final PreferencesApi preferencesApi;
  final HomeApi homeApi;

  HomesViewModel({
    required this.eventSource,
    required this.preferencesApi,
    required this.homeApi,
  });

  HomeViewModel makeViewModel(String id, AppLocalizations locale) =>
      HomeViewModel(id, locale, preferencesApi, homeApi,
          eventSource: eventSource);

  void addHome(String id) => homeApi.addHome(id, meta: const Meta());
}

class HomeViewModel extends ViewModel<HomeEvent> {
  final AppLocalizations locale;
  final PreferencesApi preferencesApi;
  final HomeApi homeApi;
  final String id;

  HomeViewModel(
    this.id,
    this.locale,
    this.preferencesApi,
    this.homeApi, {
    required super.eventSource,
  });

  HomeUiDto get home => HomeUiDto(
        locale,
        home: homeApi.getHomeById(id),
      );

  void removeHome() => homeApi.removeHome(id);

  void setCurrentHome() => preferencesApi.setHome(id);

  @override
  bool shouldNotify(HomeEvent event) =>
      event.id == id &&
      (event is HomeMetaChangedEvent || event is HomeProjectChangedEvent);
}
