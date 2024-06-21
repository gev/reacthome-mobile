import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/kit/kit.dart';

class SliverLayout extends StatelessWidget {
  final String title;
  final Widget body;

  const SliverLayout({
    required this.title,
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          app.bar.sliver(context, title: title),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: body,
          ),
        ],
      ),
    );
  }
}
