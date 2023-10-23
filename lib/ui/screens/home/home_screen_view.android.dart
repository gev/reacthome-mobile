import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/screens/home/home_screen_view_model.dart';

class HomeScreenViewAndroid extends StatelessWidget {
  final String title;
  const HomeScreenViewAndroid({super.key, required this.title});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: _NumberTitle(),
          title: Text(title),
          actions: [_AddDaemonButton()],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _DaemonsList(),
            ],
          ),
        ),
      );
}

class _AddDaemonButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.read<HomeScreenViewModel>();
    return FilledButton.icon(
      onPressed: model.addDaemon,
      icon: const Icon(Icons.add),
      label: const Text('Add'),
    );
  }
}

class _NumberTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomeScreenViewModel>();
    return Text(model.number);
  }
}

class _DaemonsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomeScreenViewModel>();
    return Expanded(
      child: ListView.builder(
        itemCount: model.daemons.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(model.daemons[index]),
        ),
      ),
    );
  }
}
