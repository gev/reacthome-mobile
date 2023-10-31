import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/screens/home/home_screen_add_button_view_model.dart';
import 'package:reacthome/ui/screens/home/home_screen_daemon_tile_view_model.dart';
import 'package:reacthome/ui/screens/home/home_screen_daemon_list_view_model.dart';

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
    final model = context.read<HomeScreenAddButtonViewModel>();
    return FilledButton.icon(
      onPressed: model.addDaemonButtonPressed,
      icon: const Icon(Icons.add),
      label: const Text('Add'),
    );
  }
}

class _NumberTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final numberTitle = context.select<HomeScreenDaemonListViewModel, String>(
        (model) => model.numberTitle);
    return Text(numberTitle);
  }
}

class _DaemonsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Iterable<String> daemons =
        context.select<HomeScreenDaemonListViewModel, Iterable<String>>(
            (model) => model.daemons);
    return Expanded(
      child: ListView(
        children: daemons
            .map((id) => _DaemonTile(key: ValueKey(id), id: id))
            .toList(),
      ),
    );
  }
}

class _DaemonTile extends StatelessWidget {
  final String id;
  const _DaemonTile({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    String title = context.select<HomeScreenDaemonTileViewModel, String>(
        (model) => model.getDaemonTitleById(id));
    return ListTile(
      title: Text(title),
    );
  }
}
