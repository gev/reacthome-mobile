import 'package:flutter/widgets.dart';

class HomeProps extends StatelessWidget {
  final String id;

  const HomeProps(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Home sweet home');
  }
}
