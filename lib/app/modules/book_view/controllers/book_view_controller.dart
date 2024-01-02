import 'package:get/get.dart';
import 'package:read_pdf_text/read_pdf_text.dart';

class BookViewController extends GetxController {
  late RxString pdfText = ''.obs;
  late RxBool isCanceled = false.obs;
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

    Future<String> _getPDFTextWithCancellation(String path) async {
    // Simulating long-running task
    for (var i = 0; i < 1000000000; i++) {
      if (isCanceled.value) {
        throw 'Operation cancelled';
      }
    }
    return ReadPdfText.getPDFtext(path);
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
