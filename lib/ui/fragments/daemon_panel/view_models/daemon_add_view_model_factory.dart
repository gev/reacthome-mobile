import 'package:flutter/widgets.dart';
import 'package:reacthome/core/daemon/daemon_command.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_add_view_model.dart';
import 'package:reacthome/util/factory.dart';

class DaemonAddViewModelFactory implements Factory<DaemonAddViewModel> {
  final DaemonCommand actor;

  DaemonAddViewModelFactory({required this.actor});

  @override
  DaemonAddViewModel create(BuildContext _) => DaemonAddViewModel(actor);
}
