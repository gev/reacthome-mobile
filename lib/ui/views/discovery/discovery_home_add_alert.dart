import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/widgets/alert.dart';

class DiscoveryHomeAddAlert extends StatelessWidget {
  const DiscoveryHomeAddAlert({super.key});

  /// Builds the widget tree for the Discovery Home Add Alert.
  ///
  /// The [BuildContext] is used to access the localization resources.
  /// Displays an alert dialog with a title and action label indicating the
  /// inability to add the home.
  ///
  /// Returns a [Widget] that shows an alert dialog with the title "cantAddTheHome"
  /// and an action label "close", both obtained from the localization resources.
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return alert(
      context,
      title: Text(locale.cantAddTheHome),
      actionLabel: locale.close,
    );
  }
}
