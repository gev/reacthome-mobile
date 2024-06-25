import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/kit/kit.dart';

class FixedWidthLayout extends StatelessWidget {
  final String title;
  final double width;
  final Widget body;

  const FixedWidthLayout({
    required this.title,
    required this.width,
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return scaffold(
      body: SizedBox(
        width: max(width, media.size.width),
        child: Center(
          child: CustomScrollView(
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
        ),
      ),
    );
  }
}
