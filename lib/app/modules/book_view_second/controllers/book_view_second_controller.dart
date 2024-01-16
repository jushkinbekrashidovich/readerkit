import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class BookViewSecondController extends GetxController {
  late String pdfPath;
  late RxString extractedText = ''.obs;
  late PdfDocument document;
  late RxBool isLoading = true.obs;
  RxInt currentPage = 0.obs;
  RxBool isBionicMode = false.obs; 
  RxBool isAppBarVisible = true.obs;

  //themeediting
  RxString fontFamily = "Bookerly".obs;
 Rx<Color> backgroundTheme = AppColors.themeWhite.obs;

  final PageController pageController = PageController();


  @override
  void onInit() {
    print("onInit called");
    initializePdfDocument();
    
    
    super.onInit();
  }
  Future<void> initializePdfDocument() async {
  pdfPath = Get.arguments;
  try {
    document = PdfDocument(inputBytes: File(pdfPath).readAsBytesSync());

    String text = PdfTextExtractor(document).extractText();

    extractedText.value = text;
    update();
  } catch (e) {
    print("Error initializing PDF document: $e");
  } finally {
    isLoading.value = false; // Set loading state to false regardless of success or failure
    
  }
}



  @override
  void dispose() {
    document.dispose();
    super.dispose();
  }
}
