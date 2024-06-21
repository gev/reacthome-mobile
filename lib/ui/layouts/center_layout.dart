import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/kit/kit.dart';

class CenterLayout extends StatelessWidget {
  final Widget body;

  const CenterLayout({required this.body, super.key});

  @override
  Widget build(BuildContext context) => scaffold(
        body: Center(
          child: body,
        ),
      );
}
