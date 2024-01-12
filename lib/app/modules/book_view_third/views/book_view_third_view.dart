import 'dart:io';

import 'package:flutter/material.dart';
import 'package:epub_view/epub_view.dart';
import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';

import '../controllers/book_view_third_controller.dart';

class BookViewThirdView extends GetView<BookViewThirdController> {
  const BookViewThirdView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var path = Get.arguments;
    return Scaffold(
      backgroundColor: AppColors.themeCream,
      
      body: Center(
        child: EpubView(
          controller: EpubController(
            document: EpubDocument.openFile(File(path)),
          ),
        ),
      ),
    );
  }
}
