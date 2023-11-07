import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_command_view_model.dart';
import 'package:reacthome/ui/widgets/add_button/add_button.dart';

class AddDaemonButton extends StatelessWidget {
  const AddDaemonButton({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<DaemonCommandViewModel>();
    return addButton(onPressed: model.addDaemonButtonPressed);
  }
}