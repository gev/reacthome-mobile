import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/fragments/add_home/widgets/add_home_id.dart';
import 'package:reacthome/ui/kit/kit.dart';
import 'package:reacthome/ui/layouts/defaut_layout.dart';

class AddHomeScreen extends StatelessWidget {
  const AddHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return DefaultLayout(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          app.bar.sliver(context, title: locale.addTheHomeID),
          const SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 32, 16, 0),
              child: AddHomeID(),
            ),
          ),
        ],
      ),
    );
  }
}
