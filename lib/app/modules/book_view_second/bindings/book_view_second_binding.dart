import 'package:get/get.dart';

import '../controllers/book_view_second_controller.dart';

class BookViewSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookViewSecondController>(
      () => BookViewSecondController(),
    );
  }
}
