import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/screens/home/home_screen_view_model.dart';

class HomeScreenIOS extends StatelessWidget {
  final String title;
  const HomeScreenIOS({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomeScreenViewModel>();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton.filled(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                onPressed: model.incrementCounter,
                child: const Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(CupertinoIcons.add, size: 28),
                  SizedBox(width: 8),
                  Text('Add'),
                ])),
            const Text(
              'Reacthome Apple',
            ),
            Text(model.counter),
          ],
        ),
      ),
    );
  }
}