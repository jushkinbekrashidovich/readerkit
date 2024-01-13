import 'package:get/get.dart';

import '../controllers/book_view_settings_controller.dart';

class BookViewSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookViewSettingsController>(
      () => BookViewSettingsController(),
    );
  }
}
