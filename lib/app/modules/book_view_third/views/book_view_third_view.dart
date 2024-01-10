
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';

import '../controllers/book_view_third_controller.dart';

class BookViewThirdView extends GetView<BookViewThirdController> {
  const BookViewThirdView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var path = Get.arguments;
    return Scaffold(
      backgroundColor: AppColors.white,
      body:Center(
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: (){
            VocsyEpub.open(
      path,
    );
          },
        ),
      ),
    );
  }
}
