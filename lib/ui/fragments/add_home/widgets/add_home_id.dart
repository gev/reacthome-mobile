import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/kit/kit.dart';

class AddHomeID extends StatelessWidget {
  const AddHomeID({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        text.field(
          placeholder: 'XXXX-XXXX-XXXX-XXXX-XXXX',
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 32, 32, 0),
          child: button.filled(
            label: locale.add,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ],
    );
  }
}
