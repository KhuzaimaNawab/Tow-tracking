import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tow_tracking/View/Screens/register_screen.dart';
import 'package:tow_tracking/theme/tow_tracking_color.dart';
import 'package:tow_tracking/theme/tow_tracking_textstyle.dart';

import '../Widgets/custom_btn.dart';
import '../Widgets/custom_textfield.dart';
import 'map_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  ValueNotifier<bool> toggleShowPass = ValueNotifier(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void Function()? toggle() {
    toggleShowPass.value = !toggleShowPass.value;
    return null;
  }

  void navigateToMap(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MapScreen(),
      ),
    );
  }

  void navigateToRegister(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const RegisterScreen(),
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
          decoration: const BoxDecoration(color: TowTrackingColors.primary),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png'),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.15,
                ),
                child: Column(
                  children: [
                    CustomTextField(
                      keyboardType: TextInputType.emailAddress,
                      icon: const Icon(
                        Icons.email,
                        color: TowTrackingColors.secondary,
                      ),
                      hintText: '| Email',
                      controller: emailController,
                    ),
                    ValueListenableBuilder(
                      valueListenable: toggleShowPass,
                      builder: (BuildContext context, value, Widget? _) {
                        return CustomTextField(
                          keyboardType: TextInputType.name,
                          icon: const Icon(
                            Icons.lock,
                            color: TowTrackingColors.secondary,
                          ),
                          hintText: '| Password',
                          obsureText: value,
                          suffixIcon: value
                              ? IconButton(
                                  onPressed: toggle,
                                  icon: const Icon(
                                    Icons.visibility_off,
                                    color: TowTrackingColors.secondary,
                                  ),
                                )
                              : IconButton(
                                  onPressed: toggle,
                                  icon: const Icon(
                                    Icons.visibility,
                                    color: TowTrackingColors.secondary,
                                  ),
                                ),
                          controller: passController,
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                onpress: () => navigateToMap(context),
                btnName: 'Login',
                color: TowTrackingColors.secondary,
                textColor: TowTrackingColors.textColorWhite,
                p_left: 20,
                p_right: 20,
                p_top: 10,
                p_bottom: 10,
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a Member?',
                    style: TowTrackingTextStyles.headlineSmall,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  GestureDetector(
                    onTap: () => navigateToRegister(context),
                    child: Text(
                      'Join Now',
                      style: TowTrackingTextStyles.headlineSmall.copyWith(
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
