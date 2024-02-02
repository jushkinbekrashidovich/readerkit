import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.lightBackground,
    primaryColor: AppColors.lightContainerColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.lightAppBarBackground,
      iconTheme: IconThemeData(color: AppColors.lightIconColor),
      titleTextStyle: TextStyle(color: AppColors.lightText1, fontSize: 17),
    ),
    
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightAppBarBackground,
       unselectedItemColor: AppColors.darkBackground,
          selectedItemColor: AppColors.mainColor,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: AppColors.lightText1),
      bodyText2: TextStyle(color: AppColors.lightText2),
    ),
    fontFamily: 'SFPro',
    
  );

  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBackground,
    primaryColor: AppColors.darkContainerColor,
    appBarTheme: const AppBarTheme(
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
    fontFamily: 'SFPro',
  );
}
