import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/fragments/home/widgets/home_props.dart';
import 'package:reacthome/ui/kit/kit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ({String home});
    final title = context.select<HomeViewModel, String>(
      (model) => model.getHomeTitle(arguments.home),
    );
    return scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          app.bar.sliver(context, title: title),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: HomeProps(arguments.home),
          ),
        ],
      ),
    );
  }
}
