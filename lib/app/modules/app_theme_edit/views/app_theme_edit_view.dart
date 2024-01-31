import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/app_theme_edit_controller.dart';

class AppThemeEditView extends GetView<AppThemeEditController> {
  const AppThemeEditView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppThemeEditView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AppThemeEditView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
