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
        onPressed: model.addDaemonButtonPressed,
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
    final numberTitle = context
        .select<HomeScreenViewModel, String>((model) => model.numberTitle);
    return Text(numberTitle);
  }
}

class _DaemonsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Iterable<String> daemons =
        context.select<HomeScreenViewModel, Iterable<String>>(
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
    String title = context.select<HomeScreenViewModel, String>(
        (model) => model.getDaemonTitleById(id));
    return CupertinoListTile(
      title: Text(title),
    );
  }
}
