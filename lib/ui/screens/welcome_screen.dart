import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/widgets/filled_button/filled_button.dart';
import 'package:reacthome/ui/widgets/logo.dart';
import 'package:reacthome/ui/widgets/screen/screen.dart';

class WelcomeScreen {
  static Widget make(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Screen.make(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Logo(),
            const SizedBox(height: 24),
            Text(locale.welcome, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 24),
            FilledButton.make(
              label: locale.addYourHome,
              onPressed: () => Navigator.of(context)
                  .pushNamed(NavigationRouteNames.discovery),
            ),
          ],
        ),
      ),
    );
  }
}
