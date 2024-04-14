
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';
import 'package:readerkit/app/data/book_model.dart';
import 'package:readerkit/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ReaderKit",
                style: TextStyle(fontSize: 18),
              ),
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        Get.toNamed(Routes.STREAK);
                      },
                      child: SvgPicture.asset("assets/svg/fire.svg", height: 23,)),
                  const SizedBox(
                    width: 19,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.addBook();
                    },
                    child: Container(
                      height: 21,
                      width: 21,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Get.isDarkMode
                              ? AppColors.white
                              : AppColors.black16),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: Get.isDarkMode
                              ? AppColors.black
                              : AppColors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   margin: const EdgeInsets.symmetric(horizontal: 12),
            //   height: 41,
            //   alignment: Alignment.center,
            //   child: TextFormField(
            //     cursorColor: AppColors.mainColor,
            //     focusNode: controller.myfocusNode,
            //     decoration: InputDecoration(
            //       focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5.0),
            //         borderSide: BorderSide(
            //           color: AppColors.mainColor,
            //         ),
            //       ),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5.0),
            //         borderSide: BorderSide(
            //           color: AppColors.mainColor,
            //         ),
            //       ),
            //       prefixIcon: Icon(
            //         CupertinoIcons.search,
            //         color: AppColors.mainColor,
            //         size: 16,
            //       ),
            //       fillColor: Color(0xFF313036),
            //       filled: true,
            //       contentPadding: EdgeInsets.symmetric(
            //           vertical: 12), // Adjust the vertical padding
            //     ),
            //     style: TextStyle(color: Colors.white),
            //   ),
            // ),

            const SizedBox(
              height: 10,
            ),

            controller.books.length == 0
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 120,
                            child: SvgPicture.asset(
                                "assets/svg/book_cover.svg")),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Upload your favorite book and start your journey!",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "You can upload book in .pdf or .epub format",
                          style: TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              
                              childAspectRatio: 0.58),
                      itemCount: controller.books.length,
                      itemBuilder: (BuildContext context, int index) {
                        Book book = controller.books.reversed.toList()[index];
                        return InkWell(
                          onTap: () {
                            Get.toNamed(Routes.BOOK_DETAILS, arguments: book);
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: Get.height*0.2,
                                width: Get.width*0.3,
                                child: Stack(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/svg/book_cover.svg"),
                                    Positioned(
                                      child: Center(
                                        child: SizedBox(
                                          height: 115,
                                          width: 70,
                                          child: Text(
                                            book.title.toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14.3),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                width: 110,
                                child: Text(
                                  book.title.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      color:
                                          AppColors.darkSecondSecondTextColor,
                                      fontSize: 11),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
