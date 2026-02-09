import 'package:chronex/base/theme/s_text_theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Home Page",
          style: STextTheme.text16,
        )
      ],
    );
  }
}
