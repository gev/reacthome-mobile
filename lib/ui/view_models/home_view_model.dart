import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/core/meta/meta.dart';
import 'package:reacthome/infrastructure/bus/bus_listener.dart';
import 'package:reacthome/ui/dto/home_ui_dto.dart';

class HomeViewModel extends BusListener<HomeEvent> with ChangeNotifier {
  final HomeApi home;

  HomeViewModel({
    required super.eventSource,
    required this.home,
  });

  HomeUiDto getHome(String id, AppLocalizations locale) => HomeUiDto(
        locale,
        home: home.getHomeById(id),
      );

  void addHome(String id) => home.addHome(id, meta: const Meta());

  void removeHome(String id) => home.removeHome(id);

  @override
  void handle(HomeEvent event) {
    switch (event) {
      case HomeMetaChangedEvent _:
      case HomeProjectChangedEvent _:
        notifyListeners();
      default:
    }
  }
}
