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
        middle: Text(title),
      ),
      child: Center(
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
}

class _IncrementCounterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.read<HomeScreenViewModel>();
    return CupertinoButton.filled(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
        onPressed: model.incrementCounter,
        child: const Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(CupertinoIcons.add, size: 28),
          SizedBox(width: 8),
          Text('Add'),
        ]));
  }
}

class _CounterTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomeScreenViewModel>();
    return Text(model.counter);
  }
}
