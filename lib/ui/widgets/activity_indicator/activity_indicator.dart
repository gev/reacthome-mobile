import 'package:reacthome/ui/widgets/activity_indicator/activity_indicator_cupertino.dart';
import 'package:reacthome/ui/widgets/activity_indicator/activity_indicator_material.dart';
import 'package:reacthome/util/platform.dart';

class ActivityIndicator extends PlatformWidget {
  ActivityIndicator({super.key})
      : super(
          cupertino: ActivityIndicatorCupertino.build(),
          material: ActivityIndicatorMaterial.build(),
        );
}
