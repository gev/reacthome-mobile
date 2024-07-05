import 'package:flutter/widgets.dart';
import 'package:reacthome/app/features/home_factory.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_list_view_model.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/screens/home_list_screen.dart';

class AddHomeListFactory {
  static final instance = AddHomeListFactory._();

  AddHomeListFactory._();

  HomeViewModel makeHomeViewModel(BuildContext context) => HomeViewModel(
        context,
        eventSource: HomeFactory.instance.homeEventBus.stream,
        home: HomeFactory.instance.makeHomeService(),
      );

  HomeListViewModel makeHomeListViewModel() => HomeListViewModel(
        eventSource: HomeFactory.instance.homeEventBus.stream,
        home: HomeFactory.instance.makeHomeService(),
      );

  Widget make(_) => const HomeListScreen();
}
