import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

class BadgeDetailsController extends GetxController {
  
   ScreenshotController screenshotController = ScreenshotController();

    RxString badgeTitle = "".obs;
   RxString  readingTime = "".obs;
   RxString badgeIcon = "".obs;
   

  @override
  void onInit() {
     final arguments = Get.arguments;
    if (arguments != null) {
      badgeTitle.value = arguments['title'] ?? 'Default Title';
      readingTime.value = arguments['time'] ?? '0';
      badgeIcon.value = arguments['Icon'] ?? 'default_icon';
    }
    
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
