import 'dart:async';
import 'dart:io';

import 'package:chronex/base/utils/utils.dart';
import 'package:chronex/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  late StreamSubscription<BluetoothAdapterState> subscription;

  @override
  void initState() {
    super.initState();
    checkBluetoothPermissions();
    requestBluetoothPermissions().then((value) {
      subscription = FlutterBluePlus.adapterState.listen((state) async {
        if (state == BluetoothAdapterState.off) {
          if (Platform.isAndroid) {
            await FlutterBluePlus.turnOn();
          } else if (Platform.isIOS) {
            showSnackBar("Please turn on Bluetooth from Control Center to proceed.");
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Center(
              child: AppButton(onPressed: startScanning, title: "Start Scanning", width: 200.w),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> requestBluetoothPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [Permission.bluetoothScan, Permission.bluetoothConnect, Permission.location].request();

    if (statuses[Permission.bluetoothScan]?.isGranted == true &&
        statuses[Permission.bluetoothConnect]?.isGranted == true &&
        statuses[Permission.location]?.isGranted == true) {
      showSnackBar("Bluetooth permissions granted");
    } else {
      showSnackBar("Bluetooth permissions denied");
      if (statuses[Permission.bluetoothScan]?.isPermanentlyDenied == true ||
          statuses[Permission.bluetoothConnect]?.isPermanentlyDenied == true ||
          statuses[Permission.location]?.isPermanentlyDenied == true) {
        openAppSettings();
      }
    }
  }

  void checkBluetoothPermissions() async {
    if (await FlutterBluePlus.isSupported == false) {
      showSnackBar("Bluetooth is not supported on this device.");
      return;
    }
  }

  void startScanning() async {
    await FlutterBluePlus.adapterState.where((val) => val == BluetoothAdapterState.on).first;
    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 15)).then((onValue) {
      
    });
  }
}
