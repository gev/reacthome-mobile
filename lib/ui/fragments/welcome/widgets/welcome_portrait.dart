import 'package:flutter/material.dart';
import 'package:reacthome/ui/fragments/welcome/widgets/welcome_greeting.dart';
import 'package:reacthome/ui/fragments/welcome/widgets/welcome_logo.dart';

class WelcomeScreenPortrait extends StatelessWidget {
  const WelcomeScreenPortrait({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final height = media.size.height * 0.525;
    final width = media.size.width;
    return Column(
      children: [
        Container(
          height: media.size.height * 0.475,
          padding: EdgeInsets.only(top: height * 0.2),
          alignment: AlignmentDirectional.center,
          child: const WelcomeGreeting(),
        ),
        WelcomeLogo(width: width, height: height),
      ],
    );
  }
}
