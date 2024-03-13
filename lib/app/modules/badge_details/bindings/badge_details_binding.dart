import 'package:get/get.dart';

import '../controllers/badge_details_controller.dart';

class BadgeDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BadgeDetailsController>(
      () => BadgeDetailsController(),
    );
  }
}
