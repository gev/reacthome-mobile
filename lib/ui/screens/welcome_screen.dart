import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/kit/kit.dart';
import 'package:reacthome/ui/widgets/logo.dart';

class WelcomeScreen {
  static Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logo(),
            const SizedBox(height: 24),
            Text(locale.welcome, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 24),
            button.filled(
              label: locale.addAHome,
              onPressed: () =>
                  Navigator.pushNamed(context, NavigationRouteNames.discovery),
            ),
          ],
        ),
      ),
    );
  }
}
