import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/core/daemon/daemon_api.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/meta.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/kit/kit.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/event_listener.dart';

class DiscoveryDaemonViewModel extends GenericEventListener<DaemonEvent>
    with ChangeNotifier {
  final BuildContext context;
  final EventBus<DaemonEvent> eventSource;
  final DaemonApi discoveredDaemon;
  final DaemonApi knownDaemon;

  DiscoveryDaemonViewModel(
    this.context, {
    required this.eventSource,
    required this.discoveredDaemon,
    required this.knownDaemon,
  }) : super(eventSource: eventSource);

  Meta? getDaemonMeta(String id) => discoveredDaemon.getDaemonById(id)?.meta;

  String getDaemonTitle(String id) =>
      getDaemonMeta(id)?.name ?? AppLocalizations.of(context)!.untitled;

  bool hasProject(String id) =>
      discoveredDaemon.getDaemonById(id)?.project != null;

  void addDaemonButtonPressed() {
    Navigator.pushNamed(context, NavigationRouteNames.addDaemon);
  }

  void onDaemonTileTap(
      String id, Widget confirmDialog, Widget alertDialog) async {
    final navigator = Navigator.of(context);
    final confirmed = await _confirm(confirmDialog);
    if (confirmed == true) {
      final daemon = discoveredDaemon.getDaemonById(id);
      if (daemon != null) {
        knownDaemon.addDaemon(
          id: id,
          meta: daemon.meta,
          address: daemon.address,
          project: daemon.project,
        );
        navigator.pushNamed(NavigationRouteNames.homeList);
      } else {
        _alert(alertDialog);
      }
    }
  }

  Future<bool?> _confirm(Widget confirmDialog) => dialog.show<bool>(
        context,
        builder: (_) => ChangeNotifierProvider(
          create: (context) => DiscoveryDaemonViewModel(
            context,
            eventSource: eventSource,
            discoveredDaemon: discoveredDaemon,
            knownDaemon: knownDaemon,
          ),
          child: confirmDialog,
        ),
      );

  void _alert(Widget alertDialog) => dialog.show(
        context,
        builder: (_) => alertDialog,
      );

  @override
  void handle(DaemonEvent event) {
    switch (event) {
      case DaemonAddedEvent _:
      case DaemonMetaChangedEvent _:
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
