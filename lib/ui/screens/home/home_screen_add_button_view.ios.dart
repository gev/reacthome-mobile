import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/screens/home/home_screen_add_button_view_model.dart';

class AddDaemonButton extends StatelessWidget {
  const AddDaemonButton({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<HomeScreenAddButtonViewModel>();
    return CupertinoButton.filled(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
        onPressed: model.addDaemonButtonPressed,
        child: const Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(CupertinoIcons.add, size: 28),
          SizedBox(width: 8),
          Text('Add'),
        ]));
  }
}
