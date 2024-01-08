import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/book_view_third_controller.dart';

class BookViewThirdView extends GetView<BookViewThirdController> {
  const BookViewThirdView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookViewThirdView'),
        centerTitle: true,
      ),
      body:Obx(
  () {
    if (controller.epubView != null) {
      return controller.epubView; // Use epubView when initialized
    } else {
      return CircularProgressIndicator(); // Placeholder or loading indicator
    }
  },
)
    );
  }
}
