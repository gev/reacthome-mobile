import 'package:flutter/cupertino.dart';

class HomeScreenViewIOS extends StatelessWidget {
  final String title;
  final Widget left;
  final Widget right;

  const HomeScreenViewIOS({
    super.key,
    required this.title,
    required this.left,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(title)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [left, right],
      ),
    );
  }
}
