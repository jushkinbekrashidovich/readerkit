import 'package:get/get.dart';

import '../controllers/book_view_controller.dart';

class BookViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookViewController>(
      () => BookViewController(),
    );
  }
}
