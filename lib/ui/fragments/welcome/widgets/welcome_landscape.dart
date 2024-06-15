import 'package:flutter/material.dart';
import 'package:reacthome/ui/fragments/welcome/widgets/welcome_greeting.dart';
import 'package:reacthome/ui/fragments/welcome/widgets/welcome_logo.dart';

class WelcomeLandscape extends StatelessWidget {
  const WelcomeLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final height = media.size.height;
    final width = media.size.width * 0.525;
    return Row(
      children: [
        RotatedBox(
          quarterTurns: 1,
          child: WelcomeLogo(width: height, height: width),
        ),
        Container(
          width: media.size.width * 0.475,
          padding: EdgeInsets.only(right: width * 0.1),
          alignment: AlignmentDirectional.center,
          child: const WelcomeGreeting(),
        ),
      ],
    );
  }
}
