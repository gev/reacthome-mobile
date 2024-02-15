import 'package:reacthome/ui/widgets/list/list_tile_chevron/list_tile_chevron_cupertino.dart';
import 'package:reacthome/ui/widgets/list/list_tile_chevron/list_tile_chevron_material.dart';
import 'package:reacthome/util/platform.dart';

class ListTileChevron extends PlatformWidget {
  ListTileChevron({super.key})
      : super(
          cupertino: ListTileChevronCupertino.build(),
          material: ListTileChevronMaterial.build(),
        );
}
