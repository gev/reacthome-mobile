import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/dto.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/fragments/home/widgets/home_delete_confirm.dart';
import 'package:reacthome/ui/kit/kit.dart';

class HomeTile extends StatelessWidget {
  final String id;
  const HomeTile({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final model = context.read<HomeViewModel>();
    final home = context.select<HomeViewModel, HomeUI>(
      (model) => model.getHome(id),
    );
    bool hasProject = context.select<HomeViewModel, bool>(
      (model) => model.hasProject(id),
    );
    return list.tile(
      title: Text(home.meta.name),
      subtitle: Text(
        id,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      leading: Icon(hasProject ? icon.home.filled : icon.home.outlined),
      onTap: () => model.onHomeTileTap(id, HomeAddConfirm(id)),
    );
  }
}
