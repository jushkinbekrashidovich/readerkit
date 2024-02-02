import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
  enum ThemeType { light, dark }
 class AppThemeEditController extends GetxController {
  final selectedTheme = ThemeType.light.obs;
  SharedPreferences? _prefs; // Declare SharedPreferences instance

  @override
  void onInit() {
    super.onInit();
    _initSharedPreferences(); // Initialize SharedPreferences
  }

  void _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    final storedTheme = _prefs!.getInt('selected_theme');

    if (storedTheme != null) {
      selectedTheme.value = ThemeType.values[storedTheme];
      Get.changeThemeMode(selectedTheme.value == ThemeType.light
          ? ThemeMode.light
          : ThemeMode.dark);
    }
  }

  void changeTheme(ThemeType newTheme) {
    selectedTheme.value = newTheme;

    // Store the selected theme in SharedPreferences
    _prefs?.setInt('selected_theme', newTheme.index);

    switch (newTheme) {
      case ThemeType.light:
        Get.changeThemeMode(ThemeMode.light);
        break;
      case ThemeType.dark:
        Get.changeThemeMode(ThemeMode.dark);
        break;
    }
  }
}
