import 'package:flutter/cupertino.dart';

class ListTileCupertino extends StatelessWidget {
  final String title;
  final Widget? trailing;
  const ListTileCupertino(this.title, {this.trailing, super.key});

  @override
  Widget build(BuildContext context) => CupertinoListTile(
        title: Text(title),
        trailing: trailing,
      );
}
