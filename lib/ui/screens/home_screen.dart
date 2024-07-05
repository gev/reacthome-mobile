import 'package:flutter/widgets.dart';
import 'package:reacthome/app/screens/home_screen_factory.dart';
import 'package:reacthome/ui/fragments/home/widgets/home_props.dart';
import 'package:reacthome/ui/layouts/full_width_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ({String home});
    final viewModel = HomeScreenFactory.instance.makeHomeViewModel(context);
    return StreamBuilder(
        stream: viewModel.stream(arguments.home),
        initialData: viewModel.getHome(arguments.home),
        builder: (context, snapshot) {
          final home = snapshot.data!;
          return FullWidthLayout(
            title: home.meta.name,
            body: HomeProps(home),
          );
        });
  }
}
