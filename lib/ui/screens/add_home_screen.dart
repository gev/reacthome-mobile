import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/fragments/add_home/widgets/add_home_id.dart';
import 'package:reacthome/ui/layouts/sliver_layout.dart';

class AddHomeScreen extends StatelessWidget {
  const AddHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return SliverLayout(
      title: locale.addTheHomeID,
      body: const Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 32, 16, 0),
        child: AddHomeID(),
      ),
    );
  }
}
