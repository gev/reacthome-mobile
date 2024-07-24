import 'package:reacthome/make/core/home_factory.dart';
import 'package:reacthome/make/core/preferences_factory.dart';
import 'package:reacthome/services/home/my_home_service.dart';

class HomeServiceFactory {
  HomeServiceFactory._();

  static Future<MyHomeService> makeMyHomeService() async => MyHomeService(
        eventSource: HomeFactory.homeEventBus.stream,
        preferencesApi: await PreferencesFactory.makePreferencesApi(),
      );

  static Future<void> make() async {
    await makeMyHomeService();
  }
}
