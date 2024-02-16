import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_theme.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initAppMetrica();
  runApp(
    GetMaterialApp(
      title: "ReaderKit",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: ThemeMode.system,
    ),
  );
}

Future<void> initAppMetrica() async {
  await AppMetrica.activate(
      AppMetricaConfig("23234592-792f-4b26-8a0b-aa3d1b4d9cc0"));
}
