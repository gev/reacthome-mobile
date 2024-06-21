import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/dto.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/fragments/home/widgets/home_props.dart';
import 'package:reacthome/ui/layouts/sliver_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ({String home});
    final home = context.select<HomeViewModel, HomeUI>(
      (model) => model.getHome(arguments.home),
    );
    return SliverLayout(
      title: home.meta.name,
      body: HomeProps(home),
    );
  }
}
