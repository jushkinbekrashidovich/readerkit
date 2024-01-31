import 'package:get/get.dart';

import '../controllers/terms_and_use_controller.dart';

class TermsAndUseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermsAndUseController>(
      () => TermsAndUseController(),
    );
  }
}
