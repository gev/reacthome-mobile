import 'package:flutter/cupertino.dart';

class ListTileIOS extends StatelessWidget {
  final String title;
  const ListTileIOS(this.title, {super.key});

  @override
  Widget build(BuildContext context) => CupertinoListTile(title: Text(title));
}
