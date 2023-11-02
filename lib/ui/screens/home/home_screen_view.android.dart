import 'package:flutter/material.dart';
import 'package:reacthome/ui/screens/home/home_screen_add_button_view.android.dart';
import 'package:reacthome/ui/screens/home/home_screen_number_title_view.dart';

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
