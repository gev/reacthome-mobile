import 'package:flutter/widgets.dart';
import 'package:reacthome/app/features/home_factory.dart';
import 'package:reacthome/ui/fragments/add_home/view_models/add_home_view_model.dart';
import 'package:reacthome/ui/screens/add_home_screen.dart';

class AddHomeScreenFactory {
  static final instance = AddHomeScreenFactory._();

  AddHomeScreenFactory._();

  AddHomeViewModel makeAddHomeViewModel(BuildContext context) =>
      AddHomeViewModel(
        context,
        home: HomeFactory.instance.makeHomeService(),
      );

  Widget make(BuildContext context) => AddHomeScreen(
        viewModel: makeAddHomeViewModel(context),
      );
}
