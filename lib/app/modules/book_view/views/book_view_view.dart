import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readerkit/app/modules/book_view/controllers/book_view_controller.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class BookViewView extends GetView<BookViewController> {
  const BookViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF8DC),
      body: Obx(
        () => Container(
          color: Color(0xffFFF8DC),
          height: double.infinity,
         padding: const EdgeInsets.only(left: 3, right: 3, top:2 ),
          child: SingleChildScrollView(
            child: HtmlWidget(
              controller.pdfText.value.isNotEmpty
                  ? '''
                <div style="font-size: 16px; color: black; text-align: justify;">
                  ${controller.pdfText.value}
                </div>
              '''
                  : 'Loading PDF text...',
              textStyle: const TextStyle(fontSize: 16, color: Colors.black),
              
              //webView: true, // Enables WebView for better HTML rendering
            ),
          ),
        ),
      ),
    );
  }
}
