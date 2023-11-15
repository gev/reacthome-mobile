import 'package:flutter/material.dart';

class ListTileAndroid extends StatelessWidget {
  final String title;
  final Widget? trailing;
  const ListTileAndroid(
    this.title, {
    this.trailing,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(title),
        trailing: trailing,
      );
}
