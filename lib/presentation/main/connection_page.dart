import 'package:chronex/base/extensions/sizedbox_extension.dart';
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
          itemBuilder: (context, index) => Text(ref.watch(bluetoothProvider).value?.services?[index].uuid.toString() ?? "No Services Found"),
          separatorBuilder: (context, index) => 12.sBHh,
          itemCount: ref.watch(bluetoothProvider).value?.services?.length ?? 0,
        ),
      ],
    );
  }
}
