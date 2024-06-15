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
    final isDark = media.platformBrightness == Brightness.dark;
    final brightness = isDark ? Brightness.light : Brightness.dark;
    final aspectRatio = media.size.width / media.size.height;
    const transparent = Color.fromARGB(0, 0, 0, 0);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: transparent,
        statusBarIconBrightness: brightness,
        systemNavigationBarColor: transparent,
        systemNavigationBarIconBrightness: brightness,
        systemNavigationBarContrastEnforced: true,
      ),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

            // **First universal version
            colors: [
              Color.fromARGB(137, 54, 218, 247),
              Color.fromARGB(139, 14, 26, 114),
            ],
            // colors: isDark
            //     ? const [
            //         // **Cold Dark
            //         // Color.fromARGB(159, 46, 237, 234),
            //         // Color.fromARGB(170, 62, 175, 223),
            //         // Color.fromARGB(206, 120, 63, 194),

            //         // **Night Dark
            //         Color.fromARGB(209, 66, 16, 147),
            //         Color.fromARGB(122, 35, 19, 123),
            //         Color.fromARGB(99, 2, 0, 45),
            //       ]
            //     : const [
            //         // **Cold Light
            //         // Color.fromARGB(129, 108, 231, 217),
            //         // Color.fromARGB(185, 102, 195, 235),
            //         // Color.fromARGB(184, 13, 110, 151),
            //       ],
          ),
        ),
        child: aspectRatio > 1
            ? const WelcomeLandscape()
            : const WelcomeScreenPortrait(),
      ),
    );
  }
}

// const darkColors = [
//   Color.fromARGB(159, 46, 237, 234),
//   Color.fromARGB(170, 62, 175, 223),
//   Color.fromARGB(206, 120, 63, 194),
// ];

// const lightColors = [
//   Color.fromARGB(129, 108, 231, 217),
//   Color.fromARGB(185, 102, 195, 235),
//   Color.fromARGB(184, 13, 110, 151),
// ];
