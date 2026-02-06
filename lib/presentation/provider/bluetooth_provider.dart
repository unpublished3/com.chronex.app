import 'dart:async';
import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class BluetoothState {
  final BluetoothAdapterState adapterState;
  final bool isScanning;

  BluetoothState({required this.adapterState, required this.isScanning});

  BluetoothState copyWith({BluetoothAdapterState? adapterState, bool? isScanning}) {
    return BluetoothState(adapterState: adapterState ?? this.adapterState, isScanning: isScanning ?? this.isScanning);
  }
}

class BluetoothNotifier extends AsyncNotifier<BluetoothState> {
  StreamSubscription<BluetoothAdapterState>? _subscription;
  StreamSubscription? _scanSub;
  StreamSubscription<List<ScanResult>>? scanSubscription;

  @override
  Future<BluetoothState> build() async {
    await _checkBluetoothSupport();
    await _requestBluetoothPermissions();

    _subscription = FlutterBluePlus.adapterState.listen((sub) async {
      state = AsyncData(state.value?.copyWith(adapterState: sub) ?? BluetoothState(adapterState: sub, isScanning: false));

      if (sub == BluetoothAdapterState.off) {
        if (Platform.isAndroid) {
          await FlutterBluePlus.turnOn();
        }
      }

      _scanSub = FlutterBluePlus.isScanning.listen((scanning) {
        state = AsyncData(
          state.value?.copyWith(isScanning: scanning) ??
              BluetoothState(adapterState: state.value?.adapterState ?? BluetoothAdapterState.unknown, isScanning: scanning),
        );
      });

      // scanSubscription = FlutterBluePlus.scanResults.listen((res) async {
      //   for (ScanResult r in res) {
      //     print("Blue device: ${r}");
      //   }
      // });
    });

    ref.onDispose(() {
      _subscription?.cancel();
      _scanSub?.cancel();
    });

    return BluetoothState(adapterState: await FlutterBluePlus.adapterState.first, isScanning: false);
  }

  Future<void> _checkBluetoothSupport() async {
    if (!await FlutterBluePlus.isSupported) {
      throw Exception("Bluetooth is not supported on this device.");
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
    await FlutterBluePlus.adapterState.where((s) => s == BluetoothAdapterState.on).first;

    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 15), withNames: ["Chronex"]);
  }
}

final bluetoothProvider = AsyncNotifierProvider<BluetoothNotifier, BluetoothState>(BluetoothNotifier.new);

final scanResultsProvider = StreamProvider.autoDispose<List<ScanResult>>((ref) {
  return FlutterBluePlus.scanResults;
});
