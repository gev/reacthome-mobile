import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_home_view_model.dart';
import 'package:reacthome/ui/fragments/home_list/view_models/home_view_model.dart';
import 'package:reacthome/ui/fragments/home_list/widgets/home_delete_confirm.dart';
import 'package:reacthome/ui/kit/kit.dart';

class HomeTile extends StatelessWidget {
  final String id;
  const HomeTile({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final model = context.read<HomeViewModel>();
    String title = context.select<HomeViewModel, String>(
      (model) => model.getHomeTitle(id),
    );
    bool hasProject = context.select<HomeViewModel, bool>(
      (model) => model.hasProject(id),
    );
    return list.tile(
      title: Text(title),
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
