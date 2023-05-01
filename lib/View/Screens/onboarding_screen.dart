import 'package:flutter/material.dart';
import 'package:tow_tracking/View/Screens/home_page.dart';

import '../../theme/tow_tracking_color.dart';
import '../Widgets/custom_btn.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
            ),
            
            CustomButton(
              onpress: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              btnName: 'Get Started',
              color: TowTrackingColors.primary,
              textColor: TowTrackingColors.textColorBlack,
              p_left: 15,
              p_right: 15,
              p_top: 10,
              p_bottom: 10,
            ),
          ],
        ),
      ),
    );
  }
}
