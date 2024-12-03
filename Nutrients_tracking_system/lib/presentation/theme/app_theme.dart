import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:statedemo/presentation/theme/app_colors.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        fontFamily: 'Poppins',
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: const ColorScheme.light(
          primary: AppColors.primaryColor,
          secondary: AppColors.primaryColor,
        ),
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        useMaterial3: false,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          color: AppColors.scaffoldBackgroundColor,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 28,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.borderColor,
          iconColor: AppColors.gray1,
          hintStyle: const TextStyle(
            color: AppColors.gray2,
            fontSize: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primaryColor,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          //Primary -Teal blue

          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            textStyle:
                Theme.of(context).textTheme.h3Bold.apply(color: Colors.white),
          ),
        ),
      );
}
