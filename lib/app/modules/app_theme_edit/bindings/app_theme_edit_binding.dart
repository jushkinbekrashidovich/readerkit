import 'package:get/get.dart';

import '../controllers/app_theme_edit_controller.dart';

class AppThemeEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppThemeEditController>(
      () => AppThemeEditController(),
    );
  }
}
