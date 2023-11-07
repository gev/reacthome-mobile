import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_list_view_model.dart';

class DaemonCount extends StatelessWidget {
  const DaemonCount({super.key});

  @override
  Widget build(BuildContext context) {
    final title = context
        .select<DaemonListViewModel, String>((model) => model.countTitle);
    return Text(title);
  }
}
