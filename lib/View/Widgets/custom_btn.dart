import 'package:flutter/material.dart';

import '../../../theme/tow_tracking_textstyle.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onpress,
      required this.btnName,
      required this.color,
      required this.textColor,
      this.p_left = 0,
      this.p_top = 0,
      this.p_right = 0,
      this.p_bottom = 0});

  final void Function()? onpress;
  final String btnName;
  final Color color;
  final Color textColor;
  final double p_left;
  final double p_top;
  final double p_right;
  final double p_bottom;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
      onPressed: onpress,
      child: Padding(
        padding: EdgeInsets.fromLTRB(p_left, p_top, p_right, p_bottom),
        child: Text(btnName,
            style: TowTrackingTextStyles.HeadlineMedium.copyWith(
              color: textColor,
            )),
      ),
    );
  }
}
