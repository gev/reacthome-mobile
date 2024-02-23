import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/core/meta.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/kit/kit.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/event_listener.dart';

class HomeViewModel extends GenericEventListener<HomeEvent>
    with ChangeNotifier {
  final BuildContext context;
  final EventBus<HomeEvent> eventSource;
  final HomeApi home;

  HomeViewModel(
    this.context, {
    required this.eventSource,
    required this.home,
  }) : super(eventSource: eventSource);

  Meta? getHomeMeta(String id) => home.getHomeById(id)?.meta;

  String getHomeTitle(String id) =>
      getHomeMeta(id)?.name ?? AppLocalizations.of(context)!.untitled;

  bool hasProject(String id) => home.getHomeById(id)?.project != null;

  void addHomeButtonPressed() {
    Navigator.pushNamed(context, NavigationRouteNames.discovery);
  }

  void onHomeTileTap(String id, Widget confirmDialog) => Navigator.pushNamed(
        context,
        NavigationRouteNames.home,
        arguments: (home: id),
      );

  Future<bool?> _confirm(Widget confirmDialog) => dialog.show<bool>(
        context,
        builder: (_) => ChangeNotifierProvider(
          create: (context) => HomeViewModel(
            context,
            eventSource: eventSource,
            home: home,
          ),
          child: confirmDialog,
        ),
      );

  @override
  void handle(HomeEvent event) {
    switch (event) {
      case HomeAddedEvent _:
      case HomeMetaChangedEvent _:
        notifyListeners();
      default:
    }
  }

  @override
  void dispose() {
    cancelSubscription();
    super.dispose();
  }
}
