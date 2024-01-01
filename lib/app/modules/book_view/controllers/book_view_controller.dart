
import 'package:get/get.dart';
import 'package:read_pdf_text/read_pdf_text.dart';

class BookViewController extends GetxController {
late RxString pdfText = ''.obs;
  @override
  void onInit() {
    extractTextFromPDF();
    super.onInit();
  }


    Future<void> extractTextFromPDF() async {
    final path = Get.arguments;

    try {
      pdfText.value = await ReadPdfText.getPDFtext(path);
      // Once you get the PDF text, you can utilize it in your UI or perform further operations.
      update(); // Notify listeners of the change in data.
    } catch (e) {
      // Handle exceptions appropriately.
      print('Failed to extract text from PDF: $e');
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
