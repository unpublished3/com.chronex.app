import 'package:flutter/material.dart';
import 'package:chronex/base/theme/app_color.dart';
import 'package:chronex/presentation/widgets/first_page_card.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

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
            const SizedBox(height: 75),
            Container(
              // A workaround because I couldn't find the exact icon
              width: 90,
              height: 90,
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
            const SizedBox(height: 10),
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
            const SizedBox(height: 25),
            const FirstPageCard(
              heading: 'Track Your Runs',
              body1: 'Monitor your distance, pace and',
              body2: 'heart rate in real time',
              icon: Icons.play_arrow_outlined,
            ),
            const SizedBox(height: 20),
            const FirstPageCard(
              heading: 'Analyze Progress',
              body1: 'Review your running history and',
              body2: 'see your improvement',
              icon: Icons.trending_up_outlined,
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                minimumSize: const Size(360, 65),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(color: AppColor.primary, fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
