import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/app/features/home_factory.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_list_view_model.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/screens/home_list_screen.dart';

class AddHomeListFactory {
  static final instance = AddHomeListFactory._();

  AddHomeListFactory._();

  Widget make(_) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => HomeViewModel(
              context,
              eventSource: HomeFactory.instance.homeEventBus,
              home: HomeFactory.instance.makeHomeService(),
            ),
          ),
          ChangeNotifierProvider(
            create: (_) => HomeListViewModel(
              eventSource: HomeFactory.instance.homeEventBus,
              home: HomeFactory.instance.makeHomeService(),
            ),
          ),
        ],
        child: const HomeListScreen(),
      );
}
