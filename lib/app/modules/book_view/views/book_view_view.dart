import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readerkit/app/modules/book_view/controllers/book_view_controller.dart';

import '../../../const/custom_widgets/bionic_text_convert.dart';


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
          padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
          child:  SingleChildScrollView(
            child: BionicReader(
              wordSpacingFactor: 1.01,
              text: controller.pdfText.value,
              startStyle: 
                GoogleFonts.newsreader(
                  
                letterSpacing: 0.5,
                height: 1.2,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                
                color: Color.lerp(Colors.black, Colors.black, 0.40),
              ),
              midStyle:  GoogleFonts.newsreader(
                letterSpacing: 0.5,
                
                height: 1.2,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 154, 148, 122),
              ),
              // Note: For the endStyle, you may set it to make the end characters almost invisible or transparent if needed.
              
            ),
          ),
        
        ),
      ),
    );
  }
}
