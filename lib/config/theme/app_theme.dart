import 'package:flutter/material.dart';
import 'package:mahmoudfawzy_flutter_task/config/theme/colors_manger.dart';

final class AppTheme {
  static ThemeData get appTheme => ThemeData(
    fontFamily: 'Tajawal',
    colorScheme:
        ColorScheme.fromSeed(
          seedColor: ColorsManger.white,
          brightness: Brightness.light,
        ).copyWith(
          // Primary Colors
          primary: ColorsManger.white,
          primaryContainer: ColorsManger.white,
          secondary: ColorsManger.extraLightOrange,

          // Surface Colors
          surface: ColorsManger.offWhit,
          surfaceContainerHighest: ColorsManger.offWhit,

          // Text Colors
          onPrimary: ColorsManger.black,
          onSecondary: ColorsManger.lightBlack,
          onSurface: ColorsManger.lightOrang,

          // Status Colors
          error: ColorsManger.deepOrange,
          onError: ColorsManger.white,

          // Outline Colors
          outline: ColorsManger.deepBlue,
          outlineVariant: ColorsManger.greyBorder,
        ),

    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: ColorsManger.black,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        color: ColorsManger.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      displaySmall: TextStyle(
        color: ColorsManger.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: TextStyle(
        color: ColorsManger.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        color: ColorsManger.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: ColorsManger.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: ColorsManger.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: ColorsManger.black,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  static ColorScheme colors(BuildContext context) =>
      Theme.of(context).colorScheme;
  static TextTheme textStyles(BuildContext context) =>
      Theme.of(context).textTheme;
}

extension AppColors on BuildContext {
  TextTheme get textStyles => Theme.of(this).textTheme;
  // Primary Colors
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get primaryContainer => Theme.of(this).colorScheme.primaryContainer;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;

  // Surface Colors
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get backgroundColor => Theme.of(this).colorScheme.primary;

  // Text Colors
  Color get onPrimaryColor => Theme.of(this).colorScheme.onPrimary;
  Color get onSurfaceColor => Theme.of(this).colorScheme.onSurface;
  Color get textPrimary => ColorsManger.black;
  Color get textSecondary => ColorsManger.lightBlack;
  Color get textTertiary => ColorsManger.extraLightOrange;

  // Status Colors
  Color get errorColor => Theme.of(this).colorScheme.error;
  Color get onErrorColor => Theme.of(this).colorScheme.onError;

  Color get white => ColorsManger.white;
  Color get black => ColorsManger.black;
  Color get lightBlack => ColorsManger.lightBlack;
  Color get extraLightOrange => ColorsManger.extraLightOrange;
  Color get lightOrang => ColorsManger.lightOrang;
  Color get deepOrange => ColorsManger.deepOrange;
  Color get fontGrey => ColorsManger.fontGrey;
  Color get green => ColorsManger.green;
  Color get offWhit => ColorsManger.offWhit;
  Color get greyBorder => ColorsManger.greyBorder;
  Color get deepBlue => ColorsManger.deepBlue;
  Color get lightBlue => ColorsManger.lightBlue;
}
