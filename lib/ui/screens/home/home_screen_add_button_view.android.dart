import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/screens/home/home_screen_add_button_view_model.dart';

class AddDaemonButton extends StatelessWidget {
  const AddDaemonButton({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<HomeScreenAddButtonViewModel>();
    return FilledButton.icon(
      onPressed: model.addDaemonButtonPressed,
      icon: const Icon(Icons.add),
      label: const Text('Add'),
    );
  }
}
