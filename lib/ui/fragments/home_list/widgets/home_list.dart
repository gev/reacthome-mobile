import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/home_list/view_models/home_list_view_model.dart';
import 'package:reacthome/ui/fragments/home_list/widgets/home_tile.dart';
import 'package:reacthome/ui/kit/kit.dart';

class HomeList extends StatelessWidget {
  final Widget ifEmpty;
  const HomeList({required this.ifEmpty, super.key});

  @override
  Widget build(BuildContext context) {
    Iterable<String> homes = context
        .select<HomeListViewModel, Iterable<String>>((model) => model.homes);
    return homes.isEmpty
        ? ifEmpty
        : list.section(
            context,
            children:
                homes.map((id) => HomeTile(key: ValueKey(id), id: id)).toList(),
          );
  }
}
