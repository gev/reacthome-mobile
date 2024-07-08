import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/kit/kit.dart';
import 'package:reacthome/ui/kit/theme.dart';
import 'package:reacthome/ui/layouts/center_layout.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return CenterLayout(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 240,
            child: Text(
              locale.welcome,
              textAlign: TextAlign.center,
              style: theme.largeTitle,
            ),
          ),
          SizedBox(height: layout.padding.vertical),
          button.filled(
            label: locale.addAHome,
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              NavigationRouteNames.discovery,
              (_) => false,
            ),
          ),
        ],
      ),
    );
  }
}
