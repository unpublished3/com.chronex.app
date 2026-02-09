import 'dart:async';
import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class BluetoothState {
  final BluetoothAdapterState adapterState;
  final bool isScanning;
  final BluetoothConnectionState? connectionState;
  final List<BluetoothService>? services;

  BluetoothState({required this.adapterState, required this.isScanning, this.connectionState, this.services});

  BluetoothState copyWith({
    BluetoothAdapterState? adapterState,
    bool? isScanning,
    BluetoothConnectionState? connectionState,
    List<BluetoothService>? services,
  }) {
    return BluetoothState(
      adapterState: adapterState ?? this.adapterState,
      isScanning: isScanning ?? this.isScanning,
      connectionState: connectionState ?? this.connectionState,
      services: services ?? this.services,
    );
  }
}

class BluetoothNotifier extends AsyncNotifier<BluetoothState> {
  StreamSubscription<BluetoothAdapterState>? _subscription;
  StreamSubscription? _scanSub;
  StreamSubscription<BluetoothConnectionState>? _connectionSub;
  BluetoothDevice? _device;
  final Map<Guid, BluetoothCharacteristic> _charCache = {};

  bool? _supported;
  bool _connecting = false;

  @override
  Future<BluetoothState> build() async {
    await _checkBluetoothSupport();
    await _requestBluetoothPermissions();

    final adapter = await FlutterBluePlus.adapterState.first;

    _subscription = FlutterBluePlus.adapterState.listen((sub) async {
      state = AsyncData(state.value?.copyWith(adapterState: sub) ?? BluetoothState(adapterState: sub, isScanning: false));

      if (sub == BluetoothAdapterState.off && Platform.isAndroid) {
        await FlutterBluePlus.turnOn();
      }
    });

    _scanSub = FlutterBluePlus.isScanning.listen((scanning) {
      state = AsyncData(state.value!.copyWith(isScanning: scanning));
    });

    ref.onDispose(() {
      _subscription?.cancel();
      _scanSub?.cancel();
      _connectionSub?.cancel();
    });

    return BluetoothState(adapterState: adapter, isScanning: FlutterBluePlus.isScanningNow);
  }

  Future<void> _checkBluetoothSupport() async {
    _supported ??= await FlutterBluePlus.isSupported;

    if (!_supported!) {
      throw Exception("Bluetooth not supported");
    }
  }

  Future<void> _requestBluetoothPermissions() async {
    final statuses = await [Permission.bluetoothScan, Permission.bluetoothConnect, Permission.location].request();

    final granted = statuses.values.every((status) => status.isGranted);

    if (!granted) {
      final permanentlyDenied = statuses.values.any((status) => status.isPermanentlyDenied);

      if (permanentlyDenied) {
        openAppSettings();
      }

      throw Exception("Bluetooth permissions denied");
    }
  }

  Future<void> startScanning() async {
    if (FlutterBluePlus.isScanningNow) return;
    await FlutterBluePlus.adapterState.where((s) => s == BluetoothAdapterState.on).first;

    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 15), withNames: ["Chronex"]);
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    if (FlutterBluePlus.isScanningNow) {
      await FlutterBluePlus.stopScan();
    }

    if (state.value?.connectionState == BluetoothConnectionState.connected) {
      return;
    }

    if (_connecting) return;
    _connecting = true;

    try {
      await device.connect(license: License.free, timeout: const Duration(seconds: 15));

      _connectionSub?.cancel();

      _connectionSub = device.connectionState.listen((connectionState) {
        _device = device;
        state = AsyncData(state.value!.copyWith(connectionState: connectionState));
      });
      if (Platform.isAndroid) await device.requestMtu(512);
    } catch (e) {
      state = AsyncData(state.value!.copyWith(connectionState: BluetoothConnectionState.disconnected));

      rethrow;
    } finally {
      _connecting = false;
    }
  }

  Future<void> disconnectFromDevice() async {
    final device = _device;

    if (device == null) return;

    await device.disconnect();
  }

  Future<void> discoverServices() async {
    final device = _device;
    if (device == null) return;

    final List<BluetoothService> services = await device.discoverServices();
    for (final s in services) {
      for (final c in s.characteristics) {
        _charCache[c.uuid] = c;
      }
    }
    state = AsyncData(state.value!.copyWith(services: services));
  }
}

final bluetoothProvider = AsyncNotifierProvider<BluetoothNotifier, BluetoothState>(BluetoothNotifier.new);

final scanResultsProvider = StreamProvider<List<ScanResult>>((ref) {
  return FlutterBluePlus.scanResults;
});
