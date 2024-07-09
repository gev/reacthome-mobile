import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/dto.dart';
import 'package:reacthome/ui/kit/kit.dart';
import 'package:reacthome/util/extensions.dart';

class HomeProps extends StatelessWidget {
  final String id;
  final HomeUI home;

  const HomeProps(this.id, this.home, {super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Column(
      children: [
        list.section(
          context,
          children: [
            list.tile(
              title: Text(id),
            ),
            list.tile(
              title: Text(home.meta.title),
              trailing: Text(locale.title),
            ),
            list.tile(
              title: Text(home.meta.code),
              trailing: Text(locale.code),
            ),
          ],
        ),
        list.section(
          context,
          children: [
            list.tile(
                title: Text(locale.connection),
                trailing: switcher(value: true)),
            list.tile(
                title: Text(locale.localConnection),
                subtitle: home.address?.let(Text.new),
                trailing: switcher(value: true)),
            list.tile(
                title: Text(locale.cloudConnection),
                subtitle: const Text('gate.reacthome.net'),
                trailing: switcher(value: false)),
          ],
        ),
      ],
    );
  }
}
