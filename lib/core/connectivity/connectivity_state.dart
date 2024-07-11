class ConnectivityState {
  final bool hasBluetooth;
  final bool hasWifi;
  final bool hasEthernet;
  final bool hasMobile;
  final bool hasVpn;
  final bool hasOther;

  ConnectivityState({
    required this.hasBluetooth,
    required this.hasWifi,
    required this.hasEthernet,
    required this.hasMobile,
    required this.hasVpn,
    required this.hasOther,
  });

  @override
  operator ==(Object other) =>
      identical(this, other) ||
      other is ConnectivityState &&
          runtimeType == other.runtimeType &&
          hasBluetooth == other.hasBluetooth &&
          hasWifi == other.hasWifi &&
          hasEthernet == other.hasEthernet &&
          hasMobile == other.hasMobile &&
          hasVpn == other.hasVpn &&
          hasOther == other.hasOther;

  @override
  int get hashCode => Object.hash(
        hasBluetooth,
        hasWifi,
        hasEthernet,
        hasMobile,
        hasVpn,
        hasOther,
      );
}
