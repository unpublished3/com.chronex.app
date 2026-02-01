import 'package:chronex/base/theme/app_theme.dart';
import 'package:chronex/navigation/app_router_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      designSize: const Size(412, 927),
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowMaterialGrid: false,
          scaffoldMessengerKey: rootScaffoldMessengerKey,
          title: "Chronex",
          routerConfig: appRouter,
          theme: AppTheme.lightTheme(context),
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
              child: AnnotatedRegion(value: SystemUiOverlayStyle.light, child: child!),
            );
          },
        );
      },
    );
  }
}
