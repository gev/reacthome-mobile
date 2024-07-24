import 'package:reacthome/common/box.dart';
import 'package:reacthome/common/emitter.dart';
import 'package:reacthome/core/preferences/preferences.dart';
import 'package:reacthome/core/preferences/preferences_api.dart';
import 'package:reacthome/core/preferences/preferences_event.dart';

class PreferencesService implements PreferencesApi {
  final Emitter<PreferencesEvent> eventSink;
  final Box<Preferences> box;

  PreferencesService({
    required this.eventSink,
    required this.box,
  });

  @override
  Iterable<String> get homes => box.value.homes;

  @override
  String? get home => box.value.home;

  @override
  String? get project => box.value.project;

  @override
  void addHome(String home) {
    final preferences = box.value;
    if (!preferences.homes.contains(home)) {
      preferences.homes.add(home);
      eventSink.emit(PreferencesHomeAddedEvent(home));
    }
  }

  @override
  void removeHome(String home) {
    final preferences = box.value;
    if (preferences.homes.contains(home)) {
      preferences.homes.remove(home);
      box.put(preferences);
      eventSink.emit(PreferencesHomeRemovedEvent(home));
    }
  }

  @override
  void setHome(String home) {
    final preferences = box.value;
    if (preferences.homes.contains(home)) {
      preferences.home = home;
      box.put(preferences);
    }
  }

  @override
  void setProject(String project) {
    final preferences = box.value;
    preferences.project = project;
    box.put(preferences);
  }
}
