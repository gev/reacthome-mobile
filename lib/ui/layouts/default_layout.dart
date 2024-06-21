import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/kit/kit.dart';

class DefaultLayout extends StatelessWidget {
  final Widget body;

  const DefaultLayout({required this.body, super.key});

  @override
  Widget build(BuildContext context) => scaffold(body: body);
}
