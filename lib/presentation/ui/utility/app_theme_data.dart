import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData lightThemeData = ThemeData(
  //primarySwatch: MaterialColor(AppColors.primaryColor.value, AppColors.colorSwatch),

    /// Progress Indicator Theme Style
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primaryColor,
    ),

    ///Input Decoration Theme Style
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      hintStyle: const TextStyle(
        color: AppColors.lightGray,
        fontWeight: FontWeight.w400,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
    ),

    /// Text Theme Style
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.lightGray,
      ),
      titleMedium: TextStyle(
        //fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.lightGray,
      ),

      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.lightGray,
      ),
      bodyLarge: TextStyle(
        //fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.lightGray,
      ),
      bodyMedium: TextStyle(
        //fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.lightGray,
      ),


    ),

    ///Elevated Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
        textStyle: const TextStyle(
          fontSize: 16,
          letterSpacing: 0.5,
        ),
        foregroundColor: Colors.white,
      ),
    )
);