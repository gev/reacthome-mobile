import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/fragments/home/widgets/home_add.dart';
import 'package:reacthome/ui/fragments/home/widgets/home_list.dart';
import 'package:reacthome/ui/kit/kit.dart';
import 'package:reacthome/ui/widgets/screen.dart';

class HomeListScreen extends StatelessWidget {
  const HomeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Screen(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          app.bar.sliver(context, title: locale.myHomes),
          const SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: Column(
              children: [
                HomeList(
                  ifEmpty: Text('There are no homes'),
                ),
                Expanded(child: HomeAdd()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
