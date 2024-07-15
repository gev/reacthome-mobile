import 'package:flutter/widgets.dart';
import 'package:reacthome/make/features/home_factory.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/screens/add_home_screen.dart';

class AddHomeScreenFactory {
  AddHomeScreenFactory._();

  static Future<HomeViewModel> makeHomeViewModel() async => HomeViewModel(
        eventSource: HomeFactory.homeEventBus.stream,
        home: await HomeFactory.makeHomeApi(),
      );

  static Future<WidgetBuilder> make() async {
    final homeViewModel = await makeHomeViewModel();
    return (_) => AddHomeScreen(
          viewModel: homeViewModel,
        );
  }
}
