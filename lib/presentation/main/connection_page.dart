import 'package:chronex/base/extensions/sizedbox_extension.dart';
import 'package:chronex/base/model/characteristic_data.dart';
import 'package:chronex/base/utils/bluetooth_uuid.dart';
import 'package:chronex/presentation/provider/bluetooth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectionPage extends ConsumerStatefulWidget {
  const ConnectionPage({super.key});

  @override
  ConsumerState<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends ConsumerState<ConnectionPage> {
  Stream<CharacteristicData>? _hrStream;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bluetoothProvider.notifier).startScanning();

      // Check if already connected on page open
      final bleState = ref.read(bluetoothProvider).value;
      if (bleState?.connectionState == BluetoothConnectionState.connected) {
        _setupServices();
      }

      // Listen for future connection changes
      ref.listenManual(bluetoothProvider, (prev, next) {
        final wasConnected = prev?.value?.connectionState == BluetoothConnectionState.connected;
        final isConnected = next.value?.connectionState == BluetoothConnectionState.connected;

        if (!wasConnected && isConnected) {
          _setupServices();
        }
      });
    });
  }

  void _setupServices() {
    ref.read(bluetoothProvider.notifier).discoverServices().then((_) {
      setState(() {
        _hrStream = ref.read(bluetoothProvider.notifier).subscribeTo(BluetoothUuids.hrUuid);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final bleState = ref.watch(bluetoothProvider).value;
    final connectionState = bleState?.connectionState;

    // Discover services once connected
    ref.listen(bluetoothProvider, (prev, next) {
      final wasConnected = prev?.value?.connectionState == BluetoothConnectionState.connected;
      final isConnected = next.value?.connectionState == BluetoothConnectionState.connected;

      if (!wasConnected && isConnected) {
        ref.read(bluetoothProvider.notifier).discoverServices().then((_) {
          setState(() {
            _hrStream = ref.read(bluetoothProvider.notifier).subscribeTo(BluetoothUuids.hrUuid);
          });
        });
      }
    });

    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Status: ${connectionState?.name ?? 'unknown'}"),

          if (_hrStream != null)
            StreamBuilder<CharacteristicData>(
              stream: _hrStream,
              builder: (_, snapshot) {
                final value = snapshot.data?.value ?? [];
                if (value.length < 2) return const Text("--");
                final hr = value[1];
                return Text("$hr bpm");
              },
            )
          else
            const Text("-"),

          Consumer(
            builder: (context, ref, _) {
              final results = ref.watch(scanResultsProvider).value ?? [];
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, _) => 12.sBHh,
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final device = results[index].device;
                  return ListTile(
                    title: Text(device.platformName),
                    subtitle: Text(device.remoteId.toString()),
                    onTap: () => ref.read(bluetoothProvider.notifier).connectToDevice(device),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
