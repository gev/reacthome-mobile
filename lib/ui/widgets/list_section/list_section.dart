import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/widgets/list_section/list_section_cupertino.dart';
import 'package:reacthome/ui/widgets/list_section/list_section_material.dart';
import 'package:reacthome/util/platform.dart';

class ListSection {
  static Widget make({
    String? title,
    required List<Widget> children,
  }) =>
      selectPlatform(
        cupertino: () => ListSectionCupertino(title, children),
        material: () => ListSectionMaterial(title, children),
      );
}
