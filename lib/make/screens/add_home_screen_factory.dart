import 'package:flutter/widgets.dart';
import 'package:reacthome/make/domain/home_factory.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/screens/add_home_screen.dart';

class AddHomeScreenFactory {
  static final instance = AddHomeScreenFactory._();

  AddHomeScreenFactory._();

  Future<HomeViewModel> makeHomeViewModel() async => HomeViewModel(
        eventSource: HomeFactory.instance.homeEventBus.stream,
        home: await HomeFactory.instance.makeHomeService(),
      );

  Future<WidgetBuilder> make() async {
    final homeViewModel = await makeHomeViewModel();
    return (_) => AddHomeScreen(
          viewModel: homeViewModel,
        );
  }
}
