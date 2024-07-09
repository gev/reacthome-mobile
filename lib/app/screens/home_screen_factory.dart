import 'package:flutter/widgets.dart';
import 'package:reacthome/app/features/home_factory.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/screens/home_screen.dart';

class HomeScreenFactory {
  static final instance = HomeScreenFactory._();

  HomeScreenFactory._();

  HomeViewModel makeHomeViewModel() => HomeViewModel(
        eventSource: HomeFactory.instance.homeEventBus.stream,
        home: HomeFactory.instance.makeHomeService(),
      );

  Widget make(_) => HomeScreen(
        viewModel: makeHomeViewModel(),
      );
}
