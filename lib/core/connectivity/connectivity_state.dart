class ConnectivityState {
  final bool hasBluetooth;
  final bool hasWifi;
  final bool hasEthernet;
  final bool hasMobile;
  final bool hasVpn;
  final bool hasOther;

  bool get hasAny =>
      hasBluetooth || hasWifi || hasEthernet || hasMobile || hasVpn || hasOther;

  bool get hasNetwork => hasWifi || hasEthernet || hasMobile;

  bool get hasLocalNetworks => hasWifi || hasEthernet;

  const ConnectivityState({
    this.hasBluetooth = false,
    this.hasWifi = false,
    this.hasEthernet = false,
    this.hasMobile = false,
    this.hasVpn = false,
    this.hasOther = false,
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
