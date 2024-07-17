import 'package:flutter/widgets.dart';
import 'package:reacthome/make/core/home_factory.dart';
import 'package:reacthome/ui/screens/home_list_screen.dart';
import 'package:reacthome/ui/view_models/home_list_view_model.dart';
import 'package:reacthome/ui/view_models/home_view_model.dart';

class AddHomeListFactory {
  AddHomeListFactory._();

  static Future<HomeViewModel> makeHomeViewModel() async => HomeViewModel(
        eventSource: HomeFactory.homeEventBus.stream,
        home: await HomeFactory.makeHomeApi(),
      );

  static Future<HomeListViewModel> makeHomeListViewModel() async =>
      HomeListViewModel(
        eventSource: HomeFactory.homeEventBus.stream,
        home: await HomeFactory.makeHomeApi(),
      );

  static Future<WidgetBuilder> make() async {
    final homeViewModel = await makeHomeViewModel();
    final homeListViewModel = await makeHomeListViewModel();
    return (_) => HomeListScreen(
          homeViewModel: homeViewModel,
          homeListViewModel: homeListViewModel,
        );
  }
}
