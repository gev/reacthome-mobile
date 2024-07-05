import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/app/features/home_factory.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_list_view_model.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/screens/home_screen.dart';

class HomeScreenFactory {
  static final instance = HomeScreenFactory._();

  HomeScreenFactory._();

  Widget make(_) => MultiProvider(
        providers: [
          Provider(
            create: (context) => HomeViewModel(
              context,
              eventSource: HomeFactory.instance.homeEventBus.stream,
              home: HomeFactory.instance.makeHomeService(),
            ),
          ),
          Provider(
            create: (_) => HomeListViewModel(
              eventSource: HomeFactory.instance.homeEventBus.stream,
              home: HomeFactory.instance.makeHomeService(),
            ),
          ),
        ],
        child: const HomeScreen(),
      );
}
