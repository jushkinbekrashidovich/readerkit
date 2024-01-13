import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';
import 'package:readerkit/app/modules/book_view/controllers/book_view_controller.dart';
import 'package:readerkit/app/routes/app_pages.dart';

class BookViewView extends GetView<BookViewController> {
  const BookViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeDark,
      appBar: AppBar(
        toolbarHeight: 34,
        leadingWidth: 8,
        backgroundColor: AppColors.themeDark,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: (){
                showModalBottomSheet(

                  context: context,
                  isScrollControlled: true, // Allow full-height sheet
                  builder: (BuildContext context) {
                    return DraggableScrollableSheet(
                      maxChildSize: 0.6,
                      builder: (BuildContext context, ScrollController scrollController) {
                        return PageView(
                          controller: PageController(),
                          children: [
                            // Your pages go here
                            Container(
                              color: Colors.red,
                              child: Center(child: Text('Page 1')),
                            ),
                            Container(
                              color: Colors.green,
                              child: Center(child: Text('Page 2')),
                            ),
                            Container(
                              color: Colors.blue,
                              child: Center(child: Text('Page 3')),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
              child: Container(
                margin: EdgeInsets.only(top: 6),
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.darkSearch,
                ),
                child: Icon(
                  CupertinoIcons.doc_plaintext,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: Obx(
        () => Container(
          //color: Color(0xffFFF8DC),
          height: double.infinity,
          padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
          child: SingleChildScrollView(
            child: SelectableText.rich(
              TextSpan(
                children: controller.pdfText.value.split(' ').map((word) {
                  return TextSpan(
                    text: '$word ',
                    style: TextStyle(
                      fontWeight: controller.selectedWord.value == word
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        controller.fetchWordDefinition(word);
                      },
                  );
                }).toList(),
              ),
              style: GoogleFonts.newsreader(
                fontSize: 18,
                letterSpacing: 0.5,
                height: 1.2,
                color: AppColors.white,
              ),
            ),

            // BionicReader(
            //   wordSpacingFactor: 1.01,
            //   text: controller.pdfText.value,
            //   startStyle:
            //     GoogleFonts.newsreader(

            //     letterSpacing: 0.5,
            //     height: 1.2,
            //     fontSize: 18,
            //     fontWeight: FontWeight.w600,

            //     color: Color.lerp(Colors.black, Colors.black, 0.40),
            //   ),
            //   midStyle:  GoogleFonts.newsreader(
            //     letterSpacing: 0.5,

            //     height: 1.2,
            //     fontSize: 18,
            //     fontWeight: FontWeight.w400,
            //     color: Color.fromARGB(255, 154, 148, 122),
            //   ),
            //   // Note: For the endStyle, you may set it to make the end characters almost invisible or transparent if needed.

            // ),
          ),
        ),
      ),
    );
  }
}

void showTranslationBottomSheet(BuildContext context, String selectedWord) {
  // Replace this with logic to fetch translation/definition
  String translation = fetchTranslation(selectedWord);

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 200,
        child: Center(
          child:
              Text('Translation or Definition of $selectedWord: $translation'),
        ),
      );
    },
  );
}

String fetchTranslation(String word) {
  // Implement your logic here to fetch translation or definition from an API or service
  // Example: You might use an HTTP package to make a GET request to an API
  // and return the translation or definition as a string
  return 'This is the translation of $word';
}
