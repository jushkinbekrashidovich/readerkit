import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';
import 'package:readerkit/app/data/book_model.dart';
import 'package:readerkit/app/modules/home/controllers/home_controller.dart';
import 'package:readerkit/app/routes/app_pages.dart';

import '../controllers/book_details_controller.dart';

class BookDetailsView extends GetView<BookDetailsController> {
  const BookDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Book book = Get.arguments as Book;
    final HomeController controller = Get.find<HomeController>();
   final BookDetailsController controllerBookDetails = Get.find<BookDetailsController>();
    void deleteBook() async {
      await controller.deleteBook(book);
      Get.back(); // Navigate back after deletion
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Details'),
        actions: [
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                onTap: () {
                  showCupertinoDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) {
                      return CupertinoTheme(
                        data: const CupertinoThemeData(),
                        child: CupertinoAlertDialog(
                          content: Column(
                            children: [
                              Text(
                                "Do you want to delete this?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(height: 30),
                            ],
                          ),
                          actions: [
                            CupertinoDialogAction(
                              child: Text("No",
                                  style: TextStyle(
                                      color: CupertinoColors.systemRed)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            CupertinoDialogAction(
                              child: Text("Yes"),
                              onPressed: () {
                                deleteBook();
                                Get.back();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  "Delete",
                  style: Get.isDarkMode
                      ? TextStyle(color: AppColors.white)
                      : TextStyle(color: AppColors.black),
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  controllerBookDetails.toggleBookFinished(book);
                },
                child: Text(
                book.isFinished ?   "Finished":"Finish",
                style: Get.isDarkMode
                      ? TextStyle(color: AppColors.white)
                      : TextStyle(color: AppColors.black),
              ),
              ),
            ];
          }),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 170,
                  width: 120,
                  child: Stack(
                    children: [
                      SvgPicture.asset("assets/svg/book_cover.svg"),
                      Positioned(
                        child: Center(
                          child: SizedBox(
                            height: 115,
                            width: 70,
                            child: Text(
                              book.title.toString(),
                              style: TextStyle(color: AppColors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(book.title,
                          style: Get.isDarkMode
                              ? TextStyle(
                                  fontSize: 15,
                                  color: AppColors.white,
                                )
                              : TextStyle(
                                  fontSize: 15,
                                  color: AppColors.black,
                                )),
                      SizedBox(height: 8),
                      // Other book details...
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           'Language',
            //           style: Get.isDarkMode
            //               ? TextStyle(
            //                   fontSize: 14,
            //                   color: AppColors.darkSecondTextColor)
            //               : TextStyle(
            //                   fontSize: 14, color: AppColors.lightText1),
            //         ),
            //         SizedBox(
            //           height: 5,
            //         ),
            //         Text(
            //           'English',
            //           style: Get.isDarkMode
            //               ? TextStyle(fontSize: 14, color: AppColors.white)
            //               : TextStyle(
            //                   fontSize: 14, color: AppColors.lightText2),
            //         ),
            //       ],
            //     ),
            //     // Pages
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           'Pages',
            //           style: Get.isDarkMode
            //               ? TextStyle(
            //                   fontSize: 14,
            //                   color: AppColors.darkSecondTextColor)
            //               : TextStyle(
            //                   fontSize: 14, color: AppColors.lightText1),
            //         ),
            //         SizedBox(
            //           height: 5,
            //         ),
            //         Text(
            //           "11",
            //           style: Get.isDarkMode
            //               ? TextStyle(fontSize: 14, color: AppColors.white)
            //               : TextStyle(
            //                   fontSize: 14, color: AppColors.lightText2),
            //         ),
            //       ],
            //     ),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           'Format',
            //           style: Get.isDarkMode
            //               ? TextStyle(
            //                   fontSize: 14,
            //                   color: AppColors.darkSecondTextColor)
            //               : TextStyle(
            //                   fontSize: 14, color: AppColors.lightText1),
            //         ),
            //         SizedBox(
            //           height: 5,
            //         ),
            //         Text(
            //           book.format.toUpperCase(),
            //           style: Get.isDarkMode
            //               ? TextStyle(fontSize: 14, color: AppColors.white)
            //               : TextStyle(
            //                   fontSize: 14, color: AppColors.lightText2),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            Expanded(child: SizedBox()),
            InkWell(
              onTap: () async {
                var pathToPdf = book.path;

                if (book.format == "pdf") {
                  await Get.toNamed(Routes.BOOK_VIEW_SECOND,
                      arguments: pathToPdf);
                } else {
                  await Get.toNamed(Routes.BOOK_VIEW_THIRD,
                      arguments: pathToPdf);
                }
              },
              child: Container(
                height: 41,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.mainColor),
                child: Text(
                  "Read",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
