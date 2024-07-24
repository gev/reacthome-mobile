import 'package:flutter/widgets.dart';
import 'package:reacthome/common/view_model.dart';

class ViewModelBuilder<L extends ViewModel> extends StatefulWidget {
  final L Function() create;
  final Widget Function(BuildContext context, L viewModel, Widget? child)
      builder;
  final Widget? child;

  const ViewModelBuilder({
    required this.create,
    required this.builder,
    this.child,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _ViewModelBuilderState<L>();
}

class _ViewModelBuilderState<L extends ViewModel>
    extends State<ViewModelBuilder<L>> {
  late L viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = widget.create();
  }

  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: viewModel,
        child: widget.child,
        builder: (context, child) => widget.builder(context, viewModel, child),
      );

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }
}
