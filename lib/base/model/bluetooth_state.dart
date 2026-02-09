import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BLEState {
  final BluetoothAdapterState adapterState;
  final bool isScanning;
  final BluetoothConnectionState? connectionState;
  final List<BluetoothService>? services;

  BLEState({required this.adapterState, required this.isScanning, this.connectionState, this.services});

  BLEState copyWith({
    BluetoothAdapterState? adapterState,
    bool? isScanning,
    BluetoothConnectionState? connectionState,
    List<BluetoothService>? services,
  }) {
    return BLEState(
      adapterState: adapterState ?? this.adapterState,
      isScanning: isScanning ?? this.isScanning,
      connectionState: connectionState ?? this.connectionState,
      services: services ?? this.services,
    );
  }
}
