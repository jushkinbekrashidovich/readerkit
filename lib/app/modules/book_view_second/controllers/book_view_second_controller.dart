import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class BookViewSecondController extends GetxController {
  late String pdfPath;
  late RxString extractedText = ''.obs;
  late PdfDocument document;
  late RxBool isLoading = true.obs;
  
  final ScrollController scrollController = ScrollController(initialScrollOffset: 50.0);
  

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

    // Add a listener after setting isLoading to false to avoid ScrollController not attached error
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      scrollController.addListener(onScroll);
    });
  }
}


  

   void onScroll() {
    print("_onScroll called");
    // Check if the scrollController is attached before accessing its properties
    if (scrollController.hasClients) {
      // Calculate the current page based on the scroll position
      final double scrollPosition = scrollController.position.pixels;
      final double maxScrollExtent = scrollController.position.maxScrollExtent;

      final double percentage = (scrollPosition / maxScrollExtent).clamp(0.0, 1.0);
      final int currentPage = (percentage * document.pages.count).ceil();

      print("Current Page: $currentPage");
    }
  }

  int calculateCurrentPage() {
    // Calculate the current page based on the scroll position
    final double scrollPosition = scrollController.position.pixels;
    final double maxScrollExtent = scrollController.position.maxScrollExtent;

    final double percentage = (scrollPosition / maxScrollExtent).clamp(0.0, 1.0);
    final int currentPage = (percentage * document.pages.count).ceil();

    return currentPage;
  }
  

  @override
  void dispose() {
    document.dispose();
     scrollController.removeListener(onScroll);
    super.dispose();
  }
}
