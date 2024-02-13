import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/widgets/filled_button/filled_button.dart';
import 'package:reacthome/ui/widgets/logo.dart';
import 'package:reacthome/ui/widgets/screen/screen.dart';

class WelcomeScreen {
  static Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final navigator = Navigator.of(context);
    return Screen(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Logo(),
            const SizedBox(height: 24),
            Text(locale.welcome, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 24),
            FilledButton(
              label: locale.addYourHome,
              onPressed: () =>
                  navigator.pushNamed(NavigationRouteNames.discovery),
            ),
          ],
        ),
      ),
    );
  }
}
