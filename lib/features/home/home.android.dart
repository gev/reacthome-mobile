import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/features/home/home_view_model.dart';

class HomePageAndroid extends StatelessWidget {
  final String title;
  const HomePageAndroid({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomeViewModel>();
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
