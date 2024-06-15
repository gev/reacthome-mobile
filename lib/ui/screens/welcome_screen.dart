import 'package:flutter/services.dart';
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
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(137, 54, 218, 247),
                  Color.fromARGB(139, 14, 26, 114),
                ],
              ),
            ),
            child: aspectRatio > 1
                ? const WelcomeLandscape()
                : const WelcomeScreenPortrait(),
          ),
        ],
      ),
    );
  }
}
