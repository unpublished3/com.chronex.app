import 'package:chronex/base/extensions/sizedbox_extension.dart';
import 'package:chronex/base/utils/utils.dart';
import 'package:chronex/presentation/provider/bluetooth_provider.dart';
import 'package:chronex/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardScreen extends ConsumerStatefulWidget {
  const OnboardScreen({super.key});

  @override
  ConsumerState<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends ConsumerState<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    final bluetoothNotifier = ref.watch(bluetoothProvider.notifier);

    ref.listen(bluetoothProvider, (previous, next) {
      if (next.value?.connectionState == BluetoothConnectionState.connected) {
        showSnackBar("Device connected successfully!");
      } else if (next.value?.connectionState == BluetoothConnectionState.disconnected) {
        showSnackBar("Device disconnected.");
      }
    });

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            ref
                .watch(scanResultsProvider)
                .when(
                  data: (res) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: res.length,
                      itemBuilder: (context, index) {
                        final device = res[index].device;
                        return ListTile(
                          title: Text(device.platformName.isNotEmpty ? device.platformName : "Unknown Device"),
                          subtitle: Text(device.remoteId.str),
                          trailing: Text("RSSI: ${res[index].rssi}"),
                          onTap: () async {
                            await bluetoothNotifier.connectToDevice(device);
                          },
                        );
                      },
                    );
                  },
                  error: (e, _) {
                    return Center(child: Text("Error: $e"));
                  },
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
            24.sBHh,
            Center(
              child: AppButton(
                isLoading: ref.watch(bluetoothProvider).value?.isScanning ?? false,
                onPressed: () async {
                  await bluetoothNotifier.startScanning();
                },
                title: "Start Scanning",
                width: 200.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
