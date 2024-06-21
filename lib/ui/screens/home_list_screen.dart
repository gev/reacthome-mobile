import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/fragments/home/widgets/home_add.dart';
import 'package:reacthome/ui/fragments/home/widgets/home_list.dart';
import 'package:reacthome/ui/layouts/sliver_layout.dart';

class HomeListScreen extends StatelessWidget {
  const HomeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return SliverLayout(
      title: locale.myHomes,
      body: const Column(
        children: [
          HomeList(
            ifEmpty: Text('There are no homes'),
          ),
          Expanded(child: HomeAdd()),
        ],
      ),
    );
  }
}
