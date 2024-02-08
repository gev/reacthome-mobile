import 'package:flutter/cupertino.dart';

class ScreenCupertino extends StatelessWidget {
  final Widget body;

  const ScreenCupertino({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: body,
      ),
    );
  }
}

class TitleScreenCupertino extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? trailing;

  const TitleScreenCupertino({
    super.key,
    required this.title,
    required this.body,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
        trailing: trailing,
      ),
      child: SafeArea(
        child: body,
      ),
    );
  }
}
