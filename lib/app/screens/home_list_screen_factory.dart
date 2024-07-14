import 'package:flutter/widgets.dart';
import 'package:reacthome/app/features/home_factory.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_list_view_model.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/screens/home_list_screen.dart';

class AddHomeListFactory {
  static final instance = AddHomeListFactory._();

  AddHomeListFactory._();

  Future<HomeViewModel> makeHomeViewModel() async => HomeViewModel(
        eventSource: HomeFactory.instance.homeEventBus.stream,
        home: await HomeFactory.instance.makeHomeService(),
      );

  Future<HomeListViewModel> makeHomeListViewModel() async => HomeListViewModel(
        eventSource: HomeFactory.instance.homeEventBus.stream,
        home: await HomeFactory.instance.makeHomeService(),
      );

  Future<WidgetBuilder> make() async {
    final homeViewModel = await makeHomeViewModel();
    final homeListViewModel = await makeHomeListViewModel();
    return (_) => HomeListScreen(
          homeViewModel: homeViewModel,
          homeListViewModel: homeListViewModel,
        );
  }
}
