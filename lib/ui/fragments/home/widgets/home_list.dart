import 'package:flutter/widgets.dart';
import 'package:reacthome/ui_kit/kit.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_list_view_model.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/fragments/home/widgets/home_tile.dart';

class HomeList extends StatelessWidget {
  final HomeViewModel homeViewModel;
  final HomeListViewModel homeListViewModel;

  const HomeList(this.homeViewModel, this.homeListViewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: homeListViewModel.stream,
      initialData: homeListViewModel.homes,
      builder: (context, snapshot) {
        final homes = snapshot.data!;
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
