import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

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
    listTileTheme: ListTileThemeData(
        tileColor: AppColors.lightContainerColor,
        titleTextStyle: TextStyle(color: AppColors.lightText1),
        iconColor: AppColors.black),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightAppBarBackground,
      unselectedItemColor: AppColors.darkBackground,
      selectedItemColor: AppColors.mainColor,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: AppColors.lightText1),
      bodyText2: TextStyle(color: AppColors.lightText2),
    ),
    
    
  );

  static final  dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.darkBackground,
    listTileTheme: ListTileThemeData(
        tileColor: AppColors.darkContainerColor,
        titleTextStyle: TextStyle(color: AppColors.white),
        iconColor: AppColors.white),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.darkBackground,
      iconTheme: IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(color: AppColors.white),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBackground,
      unselectedItemColor: AppColors.white,
      selectedItemColor: AppColors.mainColor,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: AppColors.white),
      bodyText2: TextStyle(color: AppColors.darkSecondTextColor),
    ),
  );
}
