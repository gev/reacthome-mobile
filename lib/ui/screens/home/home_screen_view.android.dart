import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/screens/home/home_screen_view_model.dart';

class HomeScreenViewAndroid extends StatelessWidget {
  final String title;
  const HomeScreenViewAndroid({super.key, required this.title});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _IncrementCounterButton(),
              _CounterTitle(),
            ],
          ),
        ),
      );
}

class _IncrementCounterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.read<HomeScreenViewModel>();
    return FilledButton.icon(
      onPressed: model.incrementCounter,
      icon: const Icon(Icons.add),
      label: const Text('Add'),
    );
  }
}

class _CounterTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomeScreenViewModel>();
    return Text(model.counter);
  }
}
