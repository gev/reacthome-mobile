import 'package:flutter/widgets.dart';
import 'package:reacthome/infrastructure/ui/kit/kit.dart';
import 'package:reacthome/util/extensions.dart';

class Connection extends StatelessWidget {
  final bool isConnected;
  final String title;
  final String? subtitle;
  final void Function(bool) onToggle;

  const Connection({
    required this.isConnected,
    required this.title,
    this.subtitle,
    required this.onToggle,
    super.key,
  });

  @override
  Widget build(BuildContext context) => list.tile(
        title: Text(title),
        subtitle: subtitle?.let(Text.new),
        trailing: switcher(
          value: isConnected,
          onChanged: onToggle,
        ),
      );
}
