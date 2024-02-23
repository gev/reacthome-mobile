import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  final String id;

  const Home(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Home sweet home');
  }
}
