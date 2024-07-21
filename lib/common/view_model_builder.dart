import 'package:flutter/widgets.dart';
import 'package:reacthome/common/view_model.dart';

class ViewModelBuilder<L extends ViewModel> extends StatelessWidget {
  final L viewModel;
  final Widget Function(BuildContext context, L viewModel, Widget? child)
      builder;
  final Widget? child;

  const ViewModelBuilder({
    required this.viewModel,
    required this.builder,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: viewModel,
        child: child,
        builder: (context, child) => builder(context, viewModel, child),
      );
}
