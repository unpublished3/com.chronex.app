import 'package:chronex/presentation/provider/bluetooth_provider.dart';
import 'package:chronex/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
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

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
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
