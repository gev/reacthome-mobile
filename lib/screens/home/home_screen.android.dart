import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/screens/home/home_screen_view_model.dart';

class HomeScreenAndroid extends StatelessWidget {
  final String title;
  const HomeScreenAndroid({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomeScreenViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.icon(
              onPressed: model.incrementCounter,
              icon: const Icon(Icons.add),
              label: const Text('Add'),
            ),
            const Text(
              'Reacthome Android',
            ),
            Text(model.counter),
          ],
        ),
      ),
    );
  }
}
