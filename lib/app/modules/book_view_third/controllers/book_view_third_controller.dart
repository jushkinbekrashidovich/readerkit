
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';

class BookViewThirdController extends GetxController {
Rx<Color> backgroundTheme = AppColors.themeWhite.obs;
var path;
  @override
  void onInit() {
    path = Get.arguments;
    super.onInit();
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
