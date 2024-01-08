import 'package:get/get.dart';

import '../controllers/book_view_third_controller.dart';

class BookViewThirdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookViewThirdController>(
      () => BookViewThirdController(),
    );
  }
}
