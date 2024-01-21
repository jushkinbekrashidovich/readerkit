
import 'dart:io';

import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookViewThirdController extends GetxController {
var path;
String? lastCfi;
 EpubController? epubController;

  @override
  void onInit() async{
    path = Get.arguments;
   print('Initializing EpubController...');
     
     try {
      epubController = EpubController(
        document: loadEpubDocument(path),
        epubCfi: '',
      );
    } catch (e) {
      // Handle any errors that might occur during loading
      print('Error loading EPUB document: $e');
    }
    super.onInit();
  }

 
  @override
  void onReady() {
     
    
    super.onReady();
  }

  Future<EpubBook> loadEpubDocument(String path) async {
    
     return await EpubReader.readBook(File(path).readAsBytes());
  }
  
  

  @override
  void onClose() async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
  lastCfi = prefs.getString('lastCfi');
  var lastCFI = epubController!.generateEpubCfi() ?? '';
    prefs.setString('lastCfi', lastCFI);
  print('Retrieved lastCfi from SharedPreferences: $lastCfi');

  
  //print(epubController!.generateEpubCfi().toString()+"hahahah");

    super.onClose();
  }
  
  @override
  void dispose() {
    print(epubController!.generateEpubCfi().toString()+"hahahah");
    super.dispose();
  }
  
   
   
}
