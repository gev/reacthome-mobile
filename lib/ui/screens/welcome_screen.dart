import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/fragments/welcome/widgets/welcome_landscape.dart';
import 'package:reacthome/ui/fragments/welcome/widgets/welcome_portrait.dart';
import 'package:reacthome/ui/kit/kit.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final aspectRatio = media.size.width / media.size.height;
    return scaffold(
      body: aspectRatio > 1
          ? const WelcomeLandscape()
          : const WelcomeScreenPortrait(),
    );
  }
}
