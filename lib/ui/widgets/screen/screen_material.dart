import 'package:flutter/material.dart';

class ScreenMaterial extends StatelessWidget {
  final Widget body;

  const ScreenMaterial({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: body,
        ),
      );
}

class TitleScreenMaterial extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? trailing;

  const TitleScreenMaterial({
    super.key,
    required this.title,
    required this.body,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget>? actions = trailing != null ? [trailing!] : [];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: SafeArea(
        child: body,
      ),
    );
  }
}
