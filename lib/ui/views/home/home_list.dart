import 'package:flutter/widgets.dart';
import 'package:reacthome/common/view_model_builder.dart';
import 'package:reacthome/ui/view_models/home_list_view_model.dart';
import 'package:reacthome/ui/view_models/home_view_model.dart';
import 'package:reacthome/ui/views/home/home_tile.dart';
import 'package:reacthome/ui_kit/kit.dart';

class HomeList extends StatelessWidget {
  final HomesViewModel homeViewModel;
  final HomeListViewModel homeListViewModel;

  const HomeList(this.homeViewModel, this.homeListViewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder(
      viewModel: homeListViewModel,
      builder: (context, viewModel, _) {
        final homes = viewModel.homes;
        return homes.isEmpty
            ? const SizedBox()
            : list.section(
                context,
                children: homes
                    .map((id) => HomeTile(id, homeViewModel, key: ValueKey(id)))
                    .toList(),
              );
      },
    );
  }
}
