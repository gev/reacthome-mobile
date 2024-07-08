import 'package:flutter/widgets.dart';
import 'package:reacthome/core/meta.dart';
import 'package:reacthome/features/home/application/home_service.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/util/navigator_extension.dart';

class AddHomeViewModel {
  final BuildContext context;

  final HomeService home;

  const AddHomeViewModel(this.context, {required this.home});

  void onAddHomeButtonPressed(String id) {
    home.addHome(id: id, meta: Meta());
    Navigator.of(context).clearNamed(
      NavigationRouteNames.home,
      arguments: (home: id),
    );
  }
}
