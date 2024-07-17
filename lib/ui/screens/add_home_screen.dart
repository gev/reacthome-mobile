import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/fragments/home/widgets/home_add_form.dart';
import 'package:reacthome/ui/view_models/home_view_model.dart';
import 'package:reacthome/ui_kit/layouts/fixed_width_layout.dart';

class AddHomeScreen extends StatelessWidget {
  final HomeViewModel viewModel;

  const AddHomeScreen({
    required this.viewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return FixedWidthLayout(
      title: locale.addTheHomeID,
      body: HomeAddForm(viewModel),
    );
  }
}
