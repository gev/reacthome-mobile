import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/kit/kit.dart';

class WelcomeGreeting extends StatelessWidget {
  const WelcomeGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 240,
          child: Text(
            locale.welcome,
            textAlign: TextAlign.center,
            style: theme.largeTitle(context),
            // style: const TextStyle(fontSize: 32),
          ),
        ),
        const SizedBox(height: 18),
        button.filled(
          label: locale.addAHome,
          onPressed: () => Navigator.pushReplacementNamed(
              context, NavigationRouteNames.discovery),
        ),
      ],
    );
  }
}
