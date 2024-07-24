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
  String? get home => box.value.home;

  @override
  void setHome(String home) {
    final preferences = box.value;
    preferences.home = home;
    box.put(preferences);
    eventSink.emit(PreferencesHomeSelectedEvent(home));
  }
}
