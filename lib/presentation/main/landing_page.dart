import 'package:flutter/material.dart';
import 'package:chronex/base/theme/app_color.dart';
import 'package:chronex/base/theme/s_text_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chronex/base/extensions/sizedbox_extension.dart';
import 'package:chronex/presentation/widgets/app_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColor.primary, Colors.lightGreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            75.sBHh,
            Container(
              // A workaround because I couldn't find the exact icon
              width: 90.w,
              height: 90.h,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(45),
                image: const DecorationImage(
                  image: AssetImage('assets/greenHeartBit.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            10.sBHh,
            const Text(
              "Chronex",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 45.0,
                color: AppColor.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Your personal running companion",
              style: TextStyle(
                fontFamily: 'Roboto',
                color: AppColor.white,
                fontSize: 20.0,
              ),
            ),
            25.sBHh,
            const FirstPageCard(
              heading: 'Track Your Runs',
              body: 'Monitor your distance, pace and heart rate in real time.',
              icon: Icons.play_arrow_outlined,
            ),
            20.sBHh,
            const FirstPageCard(
              heading: 'Analyze Progress',
              body: 'Review your running history and see your improvement.',
              icon: Icons.trending_up_outlined,
            ),
            25.sBHh,
            AppButton(
              onPressed: () {
                // Routing
              },
              title: 'Get Started',
              color: Colors.grey.shade100,
              titleColor: AppColor.primary,
              width: 360.w,
              height: 75.h,
              fontSize: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}

class FirstPageCard extends StatelessWidget {
  final IconData icon;
  final String heading;
  final String body;
  const FirstPageCard({
    super.key,
    required this.heading,
    required this.body,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      width: 360.w,
      decoration: BoxDecoration(
        color: AppColor.white.withAlpha(42),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            height: 75.h,
            width: 75.w,
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Icon(icon, color: AppColor.white, size: 55),
          ),
          Text(
            heading,
            style: const TextStyle(
              color: AppColor.white,
              fontFamily: 'Roboto',
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          5.sBHh,
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
            child: Text(
              body,
              style: STextTheme.whiteText,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
