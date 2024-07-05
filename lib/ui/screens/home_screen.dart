import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/fragments/home/widgets/home_props.dart';
import 'package:reacthome/ui/layouts/full_width_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ({String home});
    final viewModel = context.read<HomeViewModel>();
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
