import 'package:flutter/material.dart';

class ListTileMaterial extends StatelessWidget {
  final String title;
  final Widget? trailing;
  const ListTileMaterial(
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
