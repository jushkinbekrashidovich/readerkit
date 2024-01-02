import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readerkit/app/modules/book_view_second/controllers/book_view_second_controller.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class BookViewSecondView extends GetView<BookViewSecondController> {
  const BookViewSecondView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var path = Get.arguments;
    return Scaffold(
      backgroundColor: Color(0xffFFF8DC),
      body: SfPdfViewer.file(
        
        File(path),
        
        )
      
    );
  }
}
