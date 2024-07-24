import 'package:reacthome/core/preferences/preferences.dart';

class PreferencesDto {
  PreferencesDto._();

  static Preferences fromJson(Map<String, dynamic> json) => Preferences(
        home: json['home'],
      );

  static Map<String, dynamic> toJson(Preferences preferences) => {
        'home': preferences.home,
      };
}
