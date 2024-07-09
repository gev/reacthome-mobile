import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/kit/kit.dart';
import 'package:reacthome/util/navigator_extension.dart';

class HomeAddForm extends StatefulWidget {
  final HomeViewModel viewModel;

  const HomeAddForm(this.viewModel, {super.key});

  @override
  State<StatefulWidget> createState() => _HomeAddFormState();
}

class _HomeAddFormState extends State<HomeAddForm> {
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
            onPressed: () {
              widget.viewModel.addHome(_id.text);
              Navigator.of(context).clearNamed(
                NavigationRouteNames.home,
                arguments: (id: _id.text),
              );
            },
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
