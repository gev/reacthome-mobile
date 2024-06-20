import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/kit/kit.dart';

class Screen extends StatelessWidget {
  final Widget body;

  const Screen({required this.body, super.key});

  @override
  Widget build(BuildContext context) => scaffold(body: body);
}
