import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/screens/home/home_screen_view_model.dart';

class HomeScreenViewIOS extends StatelessWidget {
  final String title;
  const HomeScreenViewIOS({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          leading: _NumberTitle(),
          middle: Text(title),
          trailing: _AddDaemonButton()),
      child: _DaemonsList(),
    );
  }
}

class _AddDaemonButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.read<HomeScreenViewModel>();
    return CupertinoButton.filled(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
        onPressed: model.addDaemon,
        child: const Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(CupertinoIcons.add, size: 28),
          SizedBox(width: 8),
          Text('Add'),
        ]));
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
        itemBuilder: (context, index) => CupertinoListTile(
          title: Text(model.daemons[index]),
        ),
      ),
    );
  }
}
