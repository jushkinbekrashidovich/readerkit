import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: "Readerkit",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppThemes.dark,
    ),
  );
}
