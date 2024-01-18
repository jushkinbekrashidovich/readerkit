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
  RxBool isBionicMode = true.obs; 
  RxBool isSpeedReadingMode = false.obs;
  RxBool isAppBarVisible = true.obs;

  //page view
  final PageController pageController = PageController();
  RxInt currentPageDot = 0.obs;

  //themeediting
  RxString fontFamily = "Bookerly".obs;
  Rx<Color> backgroundTheme = AppColors.themeWhite.obs;

  //font style editing
  RxDouble textFontSize = 17.5.obs;
  RxDouble letterSpacing = 0.5.obs;
  RxDouble letterHeight = 1.2.obs;
  RxDouble wordSpacing = 1.0.obs;
  // List of available font weights
  final List<FontWeight> availableFontWeights = [
    FontWeight.w100,
    FontWeight.w200,
    FontWeight.w300,
    FontWeight.w400,
    FontWeight.w500,
    FontWeight.w600,
    FontWeight.w700,
    FontWeight.w800,
    FontWeight.w900,
  ];
  RxInt fontWeightIndex = 4.obs;
  
  void increaseFontSize() {
  if (textFontSize.value < 75) {
    textFontSize.value += 0.4;
  }
}

void decreaseFontSize() {
  if (textFontSize.value > 6) {
    textFontSize.value -= 0.4;
  }
}


 void increaseLetterSpacing() {
  if (letterSpacing.value < 27) {
    letterSpacing.value += 0.3;
  }
}

void decreaseLetterSpacing() {
  if (letterSpacing.value > 0) {
    letterSpacing.value -= 0.3;
  }
}


  void increaseWordSpacing(){
    if (wordSpacing.value < 54) {
    wordSpacing.value += 0.3;
  }

  }
  void decreaseWordSpacing(){
    if(wordSpacing.value>0){
    wordSpacing.value -=0.3;
    }
  }


  void increaseWeight(){
    if(fontWeightIndex.value<8){
    fontWeightIndex.value +=1;
    }

  }
  void decreaseWeight(){
    if(fontWeightIndex.value>0){
    fontWeightIndex.value -=1;
    }
  }
  
  void increaseHeight(){
    if(letterHeight.value<10){
    letterHeight.value +=0.2;
    }
    print(letterHeight.value);

  }
  void decreaseLetterHeight(){
    if(letterHeight.value>0.7){
    letterHeight.value -=0.2;
    }
    print(letterHeight.value);
  }
  


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
