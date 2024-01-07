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
