import 'package:reacthome/core/preferences/preferences.dart';

class PreferencesDto {
  PreferencesDto._();

  static Preferences fromJson(Map<String, dynamic> json) => Preferences(
        homes: json['homes'],
        home: json['home'],
        project: json['project'],
      );

  static Map<String, dynamic> toJson(Preferences preferences) => {
        'homes': preferences.homes,
        'home': preferences.home,
        'project': preferences.project,
      };
}
