import 'package:flutter/cupertino.dart';

class ListTileIOS extends StatelessWidget {
  final String title;
  final Widget? trailing;
  const ListTileIOS(this.title, {this.trailing, super.key});

  @override
  Widget build(BuildContext context) => CupertinoListTile(
        title: Text(title),
        trailing: trailing,
      );
}
