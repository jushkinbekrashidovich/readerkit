import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBackground,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.red, // Change the background color here
      selectedItemColor: Colors.white, // Change the selected item color
      unselectedItemColor: Colors.grey, // Change the unselected item color
    ),
    fontFamily: 'SFPro',
  );

  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.white, // Change the selected item color
      unselectedItemColor: Colors.grey, // Change the unselected item color
    ),
    fontFamily: 'SFPro',
  );
}
