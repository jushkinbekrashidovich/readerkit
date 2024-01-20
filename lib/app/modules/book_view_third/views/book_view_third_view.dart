import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:epub_view/epub_view.dart';
import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';

import '../controllers/book_view_third_controller.dart';

class BookViewThirdView extends GetView<BookViewThirdController> {
  const BookViewThirdView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: controller.backgroundTheme.value,
        appBar: AppBar(
          toolbarHeight: 39,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              CupertinoIcons.back,
              color: AppColors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  controller.backgroundTheme.value == AppColors.themeLightGray;
                },
                child: Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.darkSearch,
                  ),
                  child: Icon(
                    CupertinoIcons.doc_plaintext,
                    size: 16,
                  ),
                ),
              ),
              SizedBox(width: 10,),
              GestureDetector(
                onTap: () {
                  controller.backgroundTheme.value == AppColors.themeCream;
                },
                child: Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.darkSearch,
                  ),
                  child: Icon(
                    CupertinoIcons.doc_plaintext,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: AppColors.themeCream,
        ),
        body: EpubView(
          controller: EpubController(
            document: EpubDocument.openFile(File(controller.path)),
          ),
        ),
      ),
    );
  }
}
