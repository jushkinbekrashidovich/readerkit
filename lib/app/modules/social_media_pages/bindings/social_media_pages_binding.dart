import 'package:get/get.dart';

import '../controllers/social_media_pages_controller.dart';

class SocialMediaPagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SocialMediaPagesController>(
      () => SocialMediaPagesController(),
    );
  }
}
