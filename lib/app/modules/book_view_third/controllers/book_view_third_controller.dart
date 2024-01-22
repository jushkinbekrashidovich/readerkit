import 'dart:io';
import 'package:epub_view/epub_view.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookViewThirdController extends GetxController {
  var path;
  String? lastCfi;
  EpubController? epubController;

  @override
  void onInit() async {
    path = Get.arguments;
    print('Initializing EpubController...');
    epubController = EpubController(
      document: loadEpubDocument(path),
      epubCfi: lastCfi,
    );
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  Future<EpubBook> loadEpubDocument(String path) async {
    return await EpubReader.readBook(File(path).readAsBytes());
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
