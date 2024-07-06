import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/fragments/home/widgets/home_delete_confirm.dart';
import 'package:reacthome/ui/kit/kit.dart';

class HomeTile extends StatelessWidget {
  final String id;
  final HomeViewModel viewModel;

  const HomeTile(this.id, this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
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
            onTap: () =>
                viewModel.onHomeTileTap(id, HomeAddConfirm(id, viewModel)),
          );
        });
  }
}
