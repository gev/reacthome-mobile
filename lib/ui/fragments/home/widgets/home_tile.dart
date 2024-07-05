import 'package:flutter/widgets.dart';
import 'package:reacthome/app/screens/home_screen_factory.dart';
import 'package:reacthome/ui/fragments/home/widgets/home_delete_confirm.dart';
import 'package:reacthome/ui/kit/kit.dart';

class HomeTile extends StatelessWidget {
  final String id;
  const HomeTile({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final viewModel = HomeScreenFactory.instance.makeHomeViewModel(context);
    return StreamBuilder(
        stream: viewModel.stream(id),
        initialData: viewModel.getHome(id),
        builder: (context, snapshot) {
          final home = snapshot.data!;
          return list.tile(
            title: Text(home.meta.name),
            subtitle: Text(
              id,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            leading:
                Icon(home.hasProject ? icon.home.filled : icon.home.outlined),
            trailing: list.chevron(),
            onTap: () => viewModel.onHomeTileTap(id, HomeAddConfirm(id)),
          );
        });
  }
}
