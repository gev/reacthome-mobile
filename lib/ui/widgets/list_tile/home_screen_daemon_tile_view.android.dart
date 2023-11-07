import 'package:flutter/material.dart';

class ListTileAndroid extends StatelessWidget {
  final String title;
  const ListTileAndroid(this.title, {super.key});

  @override
  Widget build(BuildContext context) => ListTile(title: Text(title));
}
