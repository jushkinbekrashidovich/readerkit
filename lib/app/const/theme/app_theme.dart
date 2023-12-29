import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.mainColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
     textSelectionTheme: const TextSelectionThemeData(
      selectionColor: AppColors.white,
      selectionHandleColor: AppColors.mainColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.background,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.background),
      ),
      focusedBorder: OutlineInputBorder(
        
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.mainColor),
        
      ),
    ),
      
    colorScheme: const ColorScheme(
      primary: AppColors.white,
      secondary: AppColors.white,
      surface: Colors.transparent,
      background: AppColors.background,
      error: AppColors.red,
      onPrimary: AppColors.black,
      onSecondary: AppColors.black,
      onSurface: AppColors.black,
      onBackground: AppColors.background,
      onError: AppColors.red,
      brightness: Brightness.dark,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    ),
    appBarTheme: const AppBarTheme(
      elevation: 1.0, // Set the elevation to 1.0
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        
        // ios
        statusBarBrightness: Brightness.light,
        // android
        statusBarIconBrightness: Brightness.dark,
        
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(
        color: CupertinoColors.black,
      ),
      
      titleTextStyle: AppTextStyles.appBarTitle,
      color: AppColors.white, // Change the background color to AppColors.background
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: AppColors.black,
      ),
      bodyText2: TextStyle(
        color: AppColors.black,
      ),
    ),
    fontFamily: 'SFPro', 
  );


  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBackground,
bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.red, // Change the background color here
          selectedItemColor: Colors.white, // Change the selected item color
          unselectedItemColor: Colors.grey, // Change the unselected item color
        ),
    
    fontFamily: 'SFPro', 
  );
}
