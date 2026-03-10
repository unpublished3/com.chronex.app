import 'package:chronex/base/extensions/sizedbox_extension.dart';
import 'package:chronex/base/utils/bluetooth_uuid.dart';
import 'package:chronex/presentation/provider/bluetooth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectionPage extends ConsumerStatefulWidget {
  const ConnectionPage({super.key});

  @override
  ConsumerState<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends ConsumerState<ConnectionPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _discoverServices();
    });
  }

  void _discoverServices() {
    ref.read(bluetoothProvider.notifier).discoverServices();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final uuid = ref.watch(bluetoothProvider).value?.services?[index].uuid.toString() ?? "No Services Found";
            return uuid == BluetoothUuids.serviceUuid.toString()
                ? Column(
                    children: [
                      Text(uuid),
                      StreamBuilder(
                        stream: ref.watch(bluetoothProvider.notifier).subscribeTo(BluetoothUuids.characteristicUuid),
                        builder: (_, snapshot) {
                          final value = snapshot.data?.value ?? [];
                          if (value.length < 4) return const Text("--");

                          final millis = value[0] | (value[1] << 8) | (value[2] << 16) | (value[3] << 24);
                          return Text("$millis ms");
                        },
                      ),
                    ],
                  )
                : const SizedBox.shrink();
          },
          separatorBuilder: (context, index) => 12.sBHh,
          itemCount: ref.watch(bluetoothProvider).value?.services?.length ?? 0,
        ),
      ],
    );
  }
}
