import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../controllers/book_view_controller.dart';

class BookViewView extends GetView<BookViewController> {
  const BookViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
        () =>  Scaffold(
      
      body: SingleChildScrollView(
        child: Text(
          controller.pdfText.value.isNotEmpty
              ? controller.pdfText.value
              : 'Loading PDF text...', // Display a message while the text is being fetched
          style: TextStyle(fontSize: 16,color: AppColors.white, ),
          textAlign: TextAlign.justify,
          
        ),
      ),
      ),
    );
  }
}
