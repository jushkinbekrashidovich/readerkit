import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';

import '../controllers/book_details_controller.dart';

class BookDetailsView extends GetView<BookDetailsController> {
  const BookDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBackground,
        title: const Text('Book Details'),
        centerTitle: true,
        elevation: 0,
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
                        data: const CupertinoThemeData(
                          brightness: Brightness.light,
                          scaffoldBackgroundColor: Colors.white,
                        ),
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
                                // Perform delete action here
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text("Delete"),
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
                Container(
                  width: 100,
                  height: 150,
                  decoration: BoxDecoration(
                    // Replace this with your book cover image or icon
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
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
                      Text(
                        "title" * 10,
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      // Other book details...
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Language',
                      style: TextStyle(
                          fontSize: 14, color: AppColors.darkSecondTextColor),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'English',
                      style: TextStyle(fontSize: 11, color: AppColors.white),
                    ),
                  ],
                ),
                // Pages
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pages',
                      style: TextStyle(
                          fontSize: 14, color: AppColors.darkSecondTextColor),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "111",
                      style: TextStyle(fontSize: 11, color: AppColors.white),
                    ),
                  ],
                ),
                // Format
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Format',
                      style: TextStyle(
                          fontSize: 14, color: AppColors.darkSecondTextColor),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'PDF',
                      style: TextStyle(fontSize: 11, color: AppColors.white),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            InkWell(
              onTap: () {},
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
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
