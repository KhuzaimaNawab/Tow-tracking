import 'package:flutter/material.dart';
import 'package:tow_tracking/theme/themedata.dart';
import 'View/Screens/onboarding_screen.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemesTheme.themeDatalight,
      home: const OnBoardingScreen(),
    );
  }
}