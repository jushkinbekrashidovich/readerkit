import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';
import 'package:readerkit/app/modules/book_view_second/controllers/book_view_second_controller.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class BookViewSecondView extends GetView<BookViewSecondController> {
  const BookViewSecondView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.themeCream,
        appBar: AppBar(
          title: Text('${controller.calculateCurrentPage()} / ${controller.document.pages.count}'),
        ),
        drawer: Drawer(
        child: ListView.builder(
          itemCount: controller.document.bookmarks.count,
          itemBuilder: (context, index) {
            final bookmark = controller.document.bookmarks[index];
            return ListTile(
              title: Text(bookmark.title),
              onTap: (){
                
              },
              // Add onTap or other interactions as needed
            );
          },
        ),
      ),
        
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            controller: controller.scrollController,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 25, right: 8, left: 8, bottom: 8),
              child: Center(
                child: controller.isLoading.value
                    ? CircularProgressIndicator()
                    : Text(
                        controller.extractedText.value,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.newsreader(
                          fontSize: 18,
                          letterSpacing: 0.5,
                          height: 1.2,
                          color: AppColors.black,
                        ),
                      ),
              ),
            ),
          ),
        ),

      ),
    );
  }

  
}
