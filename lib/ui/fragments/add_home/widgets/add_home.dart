import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/fragments/add_home/view_models/add_home_view_model.dart';
import 'package:reacthome/ui/kit/kit.dart';

class AddHome extends StatefulWidget {
  final AddHomeViewModel viewModel;

  const AddHome(this.viewModel, {super.key});

  @override
  State<StatefulWidget> createState() => _AddHomeState();
}

class _AddHomeState extends State<AddHome> {
  late TextEditingController _id;

  @override
  void initState() {
    super.initState();
    _id = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Column(
      children: [
        layout.padding.all(
          child: text.field(
            controller: _id,
            placeholder: 'XXXX-XXXX-XXXX-XXXX-XXXX',
          ),
        ),
        layout.padding.all(
          child: button.filled(
            label: locale.add,
            onPressed: () => widget.viewModel.onAddHomeButtonPressed(_id.text),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _id.dispose();
    super.dispose();
  }
}