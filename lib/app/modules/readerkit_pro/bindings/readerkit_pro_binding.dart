import 'package:get/get.dart';

import '../controllers/readerkit_pro_controller.dart';

class ReaderkitProBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReaderkitProController>(
      () => ReaderkitProController(),
    );
  }
}
