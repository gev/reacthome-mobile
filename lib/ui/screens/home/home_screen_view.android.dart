import 'package:flutter/material.dart';

class HomeScreenViewAndroid extends StatelessWidget {
  final String title;
  final Widget left;
  final Widget right;

  const HomeScreenViewAndroid({
    super.key,
    required this.title,
    required this.left,
    required this.right,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [left, right],
          ),
        ),
      );
}
