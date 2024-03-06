
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  AppThemes._();

  static final  light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.lightAppBarBackground,
      iconTheme: IconThemeData(color: AppColors.lightIconColor),
      titleTextStyle: TextStyle(color: AppColors.lightText1),
    ),
    listTileTheme: const ListTileThemeData(
        tileColor: AppColors.lightContainerColor,
        titleTextStyle: TextStyle(color: AppColors.lightText1),
        iconColor: AppColors.black),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightAppBarBackground,
      unselectedItemColor: AppColors.darkBackground,
      selectedItemColor: AppColors.mainColor,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.lightText1),
      bodyMedium: TextStyle(color: AppColors.lightText2),
    ),
    
    
  );

  static final  dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.darkBackground,
    listTileTheme: const ListTileThemeData(
        tileColor: AppColors.darkContainerColor,
        titleTextStyle: TextStyle(color: AppColors.white),
        iconColor: AppColors.white),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.darkBackground,
      iconTheme: IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(color: Color.fromARGB(255, 188, 140, 140)),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBackground,
      unselectedItemColor: AppColors.white,
      selectedItemColor: AppColors.mainColor,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.white),
      bodyMedium: TextStyle(color: AppColors.darkSecondTextColor),
    ),
  );
}
