import 'package:reacthome/make/core/home_factory.dart';
import 'package:reacthome/make/core/preferences_factory.dart';
import 'package:reacthome/services/home/preferred_home_service.dart';

class HomeServiceFactory {
  HomeServiceFactory._();

  static Future<PreferredHomeService> makePreferredHomeService() async =>
      PreferredHomeService(
        eventSource: HomeFactory.homeEventBus.stream,
        preferencesApi: await PreferencesFactory.makePreferencesApi(),
      );

  static Future<void> make() async {
    await makePreferredHomeService();
  }
}
