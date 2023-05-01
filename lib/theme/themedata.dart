import 'package:flutter/material.dart';
import 'package:tow_tracking/theme/tow_tracking_color.dart';
import 'package:tow_tracking/theme/tow_tracking_textstyle.dart';

class ThemesTheme {
  static const TextTheme textTheme = TextTheme(
    headlineMedium: TowTrackingTextStyles.HeadlineMedium,
    headlineSmall: TowTrackingTextStyles.headlineSmall,
    bodyMedium: TowTrackingTextStyles.bodyMedium,
  );

  static const ColorScheme light = ColorScheme.light(
    primary: TowTrackingColors.primary,
    secondary: TowTrackingColors.secondary,
    background: TowTrackingColors.background,
    onBackground: TowTrackingColors.onbackground,
  );

  static ThemeData themeDatalight = ThemeData(
    textTheme: textTheme,
    colorScheme: light,
  );
}
