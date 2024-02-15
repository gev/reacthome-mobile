import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/widgets/list/list_section/list_section_cupertino.dart';
import 'package:reacthome/ui/widgets/list/list_section/list_section_material.dart';
import 'package:reacthome/util/platform.dart';

class ListSection extends PlatformWidget {
  ListSection({
    String? title,
    required List<Widget> children,
    bool hasLeading = true,
    super.key,
  }) : super(
          cupertino: ListSectionCupertino.build(title, children, hasLeading),
          material: ListSectionMaterial.build(title, children),
        );
}
