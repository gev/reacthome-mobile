import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/daemon_panel/daemon_list_view_model.dart';

class NumberTitle extends StatelessWidget {
  const NumberTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final title = context
        .select<DaemonListViewModel, String>((model) => model.numberTitle);
    return Text(title);
  }
}
