import 'package:flutter/widgets.dart';
import 'package:reacthome/make/core/home_factory.dart';
import 'package:reacthome/ui/screens/add_home_screen.dart';
import 'package:reacthome/ui/view_models/home_view_model.dart';

class AddHomeScreenFactory {
  AddHomeScreenFactory._();

  static Future<HomesViewModel> makeHomeViewModel() async => HomesViewModel(
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
