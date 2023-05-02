import 'package:flutter/material.dart';
import 'package:tow_tracking/View/Widgets/custom_textfield.dart';
import 'package:tow_tracking/theme/tow_tracking_color.dart';

import '../Widgets/custom_btn.dart';
import 'map_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final textfieldSizedBox = const SizedBox(
    height: 10,
  );

  void navigateToMap(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MapScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            color: TowTrackingColors.primary,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png'),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.15,
                ),
                child: Column(
                  children: [
                    CustomTextField(
                      keyboardType: TextInputType.name,
                      icon: const Icon(
                        Icons.person,
                        color: TowTrackingColors.secondary,
                      ),
                      hintText: 'First Name',
                      controller: firstNameController,
                    ),
                    textfieldSizedBox,
                    CustomTextField(
                      keyboardType: TextInputType.name,
                      icon: const Icon(
                        Icons.account_box_outlined,
                        color: TowTrackingColors.secondary,
                      ),
                      hintText: 'Last Name',
                      controller: lastNameController,
                    ),
                    textfieldSizedBox,
                    CustomTextField(
                      keyboardType: TextInputType.emailAddress,
                      icon: const Icon(
                        Icons.email,
                        color: TowTrackingColors.secondary,
                      ),
                      hintText: 'Email',
                      controller: emailController,
                    ),
                    textfieldSizedBox,
                    CustomTextField(
                      keyboardType: TextInputType.number,
                      icon: const Icon(
                        Icons.contact_page,
                        color: TowTrackingColors.secondary,
                      ),
                      hintText: 'Contact',
                      controller: contactController,
                    ),
                    textfieldSizedBox,
                    CustomTextField(
                      keyboardType: TextInputType.name,
                      icon: const Icon(
                        Icons.lock,
                        color: TowTrackingColors.secondary,
                      ),
                      hintText: 'Password',
                      controller: passwordController,
                    ),
                    textfieldSizedBox,
                    CustomTextField(
                      keyboardType: TextInputType.name,
                      icon: const Icon(
                        Icons.lock,
                        color: TowTrackingColors.secondary,
                      ),
                      hintText: 'Confirm Password',
                      controller: confirmPasswordController,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                onpress: () => navigateToMap(context),
                btnName: 'Sign In',
                color: TowTrackingColors.secondary,
                textColor: TowTrackingColors.textColorWhite,
                p_left: 20,
                p_right: 20,
                p_top: 10,
                p_bottom: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
