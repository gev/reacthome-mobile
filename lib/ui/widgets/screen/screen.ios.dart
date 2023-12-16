import 'package:flutter/cupertino.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_status.dart';

class ScreenIOS extends StatelessWidget {
  final Widget body;

  const ScreenIOS({
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

class TitleScreenIOS extends StatelessWidget {
  final String title;
  final Widget body;

  const TitleScreenIOS({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
        trailing: const DiscoveryStatus(),
      ),
      child: SafeArea(
        child: body,
      ),
    );
  }
}
