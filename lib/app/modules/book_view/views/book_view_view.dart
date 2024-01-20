import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';
import 'package:readerkit/app/modules/book_view/controllers/book_view_controller.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookViewView extends GetView<BookViewController> {
  const BookViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var path = Get.arguments;
    return Scaffold(
      backgroundColor: AppColors.themeDark,
      body: SfPdfViewer.file(
        File(path),
        
        ),
    );
  }
}
