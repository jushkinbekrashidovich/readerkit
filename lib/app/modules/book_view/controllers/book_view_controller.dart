import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:read_pdf_text/read_pdf_text.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:readerkit/app/const/theme/app_colors.dart';
class BookViewController extends GetxController {
  late RxString pdfText = ''.obs;
  late RxBool isCanceled = false.obs;
  late RxString selectedWord = ''.obs;
  late RxString wordDefinition = ''.obs;
  @override
  void onInit() {
    extractTextFromPDF();
    super.onInit();
  }
   
   Future<void> fetchWordDefinition(String word) async {
    selectedWord.value = word;

    final apiUrl = 'https://api.dictionaryapi.dev/api/v2/entries/en/$word';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          final meanings = data[0]['meanings'];
          if (meanings != null && meanings.isNotEmpty) {
            final definition = meanings[0]['definitions'][0]['definition'];
            wordDefinition.value = definition.toString();
            showTranslationBottomSheet();
          }
        }
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

void showTranslationBottomSheet() {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
           color: AppColors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
        ),
       
        height: 200,
        child: Center(
          child: Obx(
            () => Text(
              '${selectedWord.value}: ${wordDefinition.value}',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> extractTextFromPDF() async {
    final path = Get.arguments;

    try {
      pdfText.value = await ReadPdfText.getPDFtext(path);
      update(); 
    } catch (e) {
      print('Failed to extract text from PDF: $e');
    }
  }
  
  
  

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    isCanceled.value = true;
    super.onClose();
  }
}
