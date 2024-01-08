import 'dart:io';

import 'package:get/get.dart';
import 'package:epub_view/epub_view.dart';
class BookViewThirdController extends GetxController {
  
 late EpubView epubView;
late EpubController epubController;
  @override
  void onInit() {
    loadBook();
    super.onInit();
  }

  Future<void> loadBook() async {
    final path = Get.arguments;
    try {
      final file = File(path);
      final List<int> bytes = await file.readAsBytes();
      final EpubBook epubBook = await EpubReader.readBook(bytes);
      epubController = EpubController(document: epubBook);
      epubView = EpubView(controller: epubController);
    } catch (e) {
      print('Error loading book: $e');
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
