import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/widgets/list_section/list_section_cupertino.dart';
import 'package:reacthome/ui/widgets/list_section/list_section_material.dart';
import 'package:reacthome/util/platform.dart';

class ListSection extends PlatformWidget {
  ListSection({
    String? title,
    required List<Widget> children,
    super.key,
  }) : super(
          cupertino: ListSectionCupertino.build(title, children),
          material: ListSectionMaterial.build(title, children),
        );
}
