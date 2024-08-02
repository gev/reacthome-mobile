import 'package:reacthome/common/bus/bus.dart';
import 'package:reacthome/common/repository/box_repository.dart';
import 'package:reacthome/core/preferences/preferences.dart';
import 'package:reacthome/core/preferences/preferences_api.dart';
import 'package:reacthome/core/preferences/preferences_dto.dart';
import 'package:reacthome/core/preferences/preferences_event.dart';
import 'package:reacthome/core/preferences/preferences_service.dart';
import 'package:reacthome/infrastructure/repository/persistent_box_repository.dart';

class PreferencesFactory {
  PreferencesFactory._();

  static final eventBus = Bus<PreferencesEvent>();

  static Future<BoxRepository<Preferences>> makePreferencesBox() =>
      PersistentBoxRepository.make(
        Preferences(),
        name: 'preferences',
        scope: 'reacthome',
        fromJson: (json) => PreferencesDto.fromJson(json),
        toJson: (preferences) => PreferencesDto.toJson(preferences),
      );

  static Future<PreferencesApi> makePreferencesApi() async =>
      PreferencesService(
        eventSink: eventBus.sink,
        box: await makePreferencesBox(),
      );
}
