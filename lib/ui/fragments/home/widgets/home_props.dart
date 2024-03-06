import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/dto.dart';

class HomeProps extends StatelessWidget {
  final HomeUI home;

  const HomeProps(this.home, {super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Home sweet home');
  }
}
