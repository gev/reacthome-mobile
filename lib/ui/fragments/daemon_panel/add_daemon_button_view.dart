import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/widgets/add_button/add_button.dart';
import 'package:reacthome/ui/fragments/daemon_panel/add_daemon_button_view_model.dart';

class AddDaemonButton extends StatelessWidget {
  const AddDaemonButton({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<AddDaemonButtonViewModel>();
    return addButton(onPressed: model.addDaemonButtonPressed);
  }
}
