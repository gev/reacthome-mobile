import 'package:flutter/widgets.dart';
import 'package:reacthome/app/screens/home_screen_factory.dart';
import 'package:reacthome/ui/fragments/home/widgets/home_tile.dart';
import 'package:reacthome/ui/kit/kit.dart';

class HomeList extends StatelessWidget {
  final Widget ifEmpty;
  const HomeList({required this.ifEmpty, super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = HomeScreenFactory.instance.makeHomeListViewModel();
    return StreamBuilder(
      stream: viewModel.stream,
      initialData: viewModel.homes,
      builder: (context, snapshot) {
        final homes = snapshot.data!;
        return homes.isEmpty
            ? ifEmpty
            : list.section(
                context,
                children: homes
                    .map((id) => HomeTile(key: ValueKey(id), id: id))
                    .toList(),
              );
      },
    );
  }
}
