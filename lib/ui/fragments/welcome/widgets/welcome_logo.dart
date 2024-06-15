import 'package:flutter/material.dart';
import 'package:reacthome/ui/widgets/logo.dart';

class WelcomeLogo extends StatelessWidget {
  final double width;
  final double height;

  const WelcomeLogo({
    required this.width,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final aspectRatio = width / height;
    return Opacity(
      opacity: 0.75,
      child: SizedBox(
        height: height,
        width: width,
        child: UnconstrainedBox(
          clipBehavior: Clip.antiAlias,
          alignment: AlignmentDirectional.topCenter,
          child: aspectRatio > 1
              ? logo(width: width, height: width)
              : logo(width: height, height: height),
        ),
      ),
    );
  }
}
