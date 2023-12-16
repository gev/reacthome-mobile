import 'package:flutter/material.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_status.dart';

class ScreenAndroid extends StatelessWidget {
  final Widget body;

  const ScreenAndroid({
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

class TitleScreenAndroid extends StatelessWidget {
  final String title;
  final Widget body;

  const TitleScreenAndroid({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: const [DiscoveryStatus()],
        ),
        body: SafeArea(
          child: body,
        ),
      );
}
