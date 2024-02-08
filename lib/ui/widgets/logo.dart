import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reacthome/ui/assets.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) =>
      SvgPicture.asset(Assets.logo, width: 100);
}
