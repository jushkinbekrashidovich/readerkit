import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  PageController pageController = PageController();
  RxInt currentPageDot = 0.obs;

  //theme editing
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

  void increaseWordSpacing() {
    if (wordSpacing.value < 54) {
      wordSpacing.value += 0.3;
    }
  }

  void decreaseWordSpacing() {
    if (wordSpacing.value > 0) {
      wordSpacing.value -= 0.3;
    }
  }

  void increaseWeight() {
    if (fontWeightIndex.value < 8) {
      fontWeightIndex.value += 1;
    }
  }

  void decreaseWeight() {
    if (fontWeightIndex.value > 0) {
      fontWeightIndex.value -= 1;
    }
  }

  void increaseHeight() {
    if (letterHeight.value < 10) {
      letterHeight.value += 0.2;
    }
    print(letterHeight.value);
  }

  void decreaseLetterHeight() {
    if (letterHeight.value > 0.7) {
      letterHeight.value -= 0.2;
    }
    print(letterHeight.value);
  }

  @override
  void onInit() async {
    await initializePdfDocument();
    await initializeSharedPreferences();

    super.onInit();
  }

  Future<void> initializeSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int lastViewedPage = prefs.getInt('lastViewedPage_$pdfPath') ?? 0;
    print("Last Viewed Page: $lastViewedPage");

    // Use the constructor to set the initialPage
    pageController = PageController(initialPage: lastViewedPage);
    currentPage.value = lastViewedPage;
  }

  Future<void> initializePdfDocument() async {
    pdfPath = Get.arguments;
    try {
      document = await compute(extractPdfDocument, pdfPath);

      // Check if the text is already cached
      String? cachedText = await getCachedText(pdfPath);
      if (cachedText != null) {
        extractedText.value = cachedText;
      } else {
        // Extract text and update cache
        String text = await compute(extractTextInBackground, document);
        extractedText.value = text;
        update();
        await cacheText(pdfPath, text);
      }
    } catch (e) {
      print("Error initializing PDF document: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveLastViewedPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('lastViewedPage_$pdfPath', currentPage.value);
    print("Saved Last Viewed Page: ${currentPage.value}");
  }

  @override
  void onReady() {
    pageController.jumpToPage(currentPage.value);
    super.onReady();
  }

  @override
  void onClose() async {
    await saveLastViewedPage();
    super.onClose();
  }

  @override
  void dispose() async {
    pageController.dispose(); // Dispose of the controller
    document.dispose();
    super.dispose();
  }

  static Future<PdfDocument> extractPdfDocument(String pdfPath) async {
    return PdfDocument(inputBytes: File(pdfPath).readAsBytesSync());
  }

  static Future<String> extractTextInBackground(PdfDocument document) async {
    return PdfTextExtractor(document).extractText();
  }

  Future<String?> getCachedText(String pdfPath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('pdfText_$pdfPath');
  }

  Future<void> cacheText(String pdfPath, String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('pdfText_$pdfPath', text);
  }
}
