import 'package:flutter/material.dart';
import 'package:chronex/base/theme/app_color.dart';

class FirstPageCard extends StatelessWidget {
  final IconData icon;
  final String heading;
  final String body1;
  final String body2;
  const FirstPageCard({
    super.key,
    required this.heading,
    required this.body1,
    required this.body2,
    required this.icon,
  });

  static const TextStyle style = TextStyle(
    color: AppColor.white,
    fontFamily: 'Roboto',
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 360,
      decoration: BoxDecoration(
        color: AppColor.white.withAlpha(42),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            height: 75,
            width: 75,
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
          const SizedBox(height: 5),
          Text(body1, style: style),
          Text(
            //splitted text for better formatting
            body2,
            style: style,
          ),
        ],
      ),
    );
  }
}
