import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:readerkit/app/const/custom_widgets/edit_font_view/font_edit_style.dart';
import 'package:readerkit/app/const/custom_widgets/edit_font_view/theme_edit_style.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';
import 'package:readerkit/app/modules/book_view_second/controllers/book_view_second_controller.dart';

class BookViewSecondView extends GetView<BookViewSecondController> {
  const BookViewSecondView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: controller.backgroundTheme.value,
        appBar: controller.isAppBarVisible.value
            ? AppBar(
                toolbarHeight: 39,
                leading: IconButton(
                  icon: const Icon(CupertinoIcons.back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                backgroundColor: AppColors.themeDark,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Page:${controller.currentPage.value + 1}',
                          style: TextStyle(fontSize: 12, color: Colors.blue),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.pageController.jumpToPage(controller.currentPage.value);
                        print(controller.pageController.initialPage.toString() +
                            "initial page");
                      },
                      child: Container(
                        height: 20,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(2)),
                        child: Text(
                          "Go to last",
                          style: TextStyle(fontSize: 13, color: Colors.blue),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.isBionicMode.value =
                            !controller.isBionicMode.value;
                      },
                      child: Container(
                        height: 20,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(2)),
                        child: Text(
                          controller.isBionicMode.value ? "Bionic" : "Standart",
                          style: TextStyle(fontSize: 13, color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                          ),
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder:
                                  (BuildContext context, StateSetter setState) {
                                List<Widget> pages = [
                                  ThemeEditStyle(
                                    themeDarkOntap: () {
                                      controller.backgroundTheme.value =
                                          AppColors.themeDark;
                                    },
                                    themeCreamOntap: () {
                                      controller.backgroundTheme.value =
                                          AppColors.themeCream;
                                    },
                                    themeBeigeOntap: () {
                                      controller.backgroundTheme.value =
                                          AppColors.themeBeige;
                                    },
                                    themeOffWhite: () {
                                      controller.backgroundTheme.value =
                                          AppColors.themeOffWhite;
                                    },
                                    styleBookerlyOntap: () {
                                      controller.fontFamily.value = "Bookerly";
                                    },
                                    styleCaecOntap: () {
                                      controller.fontFamily.value = "Caec";
                                    },
                                    styleAmazaonOntap: () {
                                      controller.fontFamily.value =
                                          "AmazonEmber";
                                    },
                                    styleNewsOntap: () {
                                      controller.fontFamily.value = "News";
                                    },
                                    styleBaskervilleOntap: () {
                                      controller.fontFamily.value = "Baskervi";
                                    },
                                    stylePalatinoOntap: () {
                                      controller.fontFamily.value = "Palatino";
                                    },
                                  ),
                                  //font style
                                  FontEditStyle(
                                    decreaseFontSizeOntap: () {
                                      controller.decreaseFontSize();
                                    },
                                    increaseFontSizeOntap: () {
                                      controller.increaseFontSize();
                                    },
                                    textFontSize: "F-Size",
                                    decreaseLetterSpacingOntap: () {
                                      controller.decreaseLetterSpacing();
                                    },
                                    increaseLetterSpacingOntap: () {
                                      controller.increaseLetterSpacing();
                                    },
                                    textLetterSpacing: "L-Space",
                                    decreaseWordSpacingOntap: () {
                                      controller.decreaseWordSpacing();
                                    },
                                    increaseWordSpacingOntap: () {
                                      controller.increaseWordSpacing();
                                    },
                                    textWordSpacing: "W-Space",
                                    decreaseFontWeightOntap: () {
                                      controller.decreaseWeight();
                                    },
                                    increaseFontWeightOntap: () {
                                      controller.increaseWeight();
                                    },
                                    textFontWeight: "F-Weight",
                                    decreaseHeightOntap: () {
                                      controller.decreaseLetterHeight();
                                    },
                                    increaseHeightOntap: () {
                                      controller.increaseHeight();
                                    },
                                    textHeight: "W-Height",
                                  ),
                                  //speed reading
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 18,
                                      ),
                                      Text(
                                        "Speed Reading",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 28,
                                      ),
                                      Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.blue, // Border color
                                            width: 1.2, // Border width
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Start".toUpperCase(),
                                            style: TextStyle(
                                              color: Colors.black, // Text color
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 35,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            height: 37,
                                            width: 59,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3.2),
                                                color: AppColors.themeDark),
                                            child: Icon(
                                              CupertinoIcons.textbox,
                                              size: 18,
                                              color: AppColors.white,
                                            ),
                                          ),
                                          Text(
                                            "4",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Container(
                                            height: 37,
                                            width: 59,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3.2),
                                                color: AppColors.themeDark),
                                            child: Icon(
                                              CupertinoIcons.textbox,
                                              size: 25,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            height: 37,
                                            width: 59,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3.2),
                                                color: AppColors.themeDark),
                                            child: Icon(
                                              CupertinoIcons.speedometer,
                                              size: 18,
                                              color: AppColors.white,
                                            ),
                                          ),
                                          Text(
                                            "3",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Container(
                                            height: 37,
                                            width: 59,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3.2),
                                                color: AppColors.themeDark),
                                            child: Icon(
                                              CupertinoIcons.speedometer,
                                              size: 25,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  // Add more pages as needed
                                ];

                                return Column(
                                  children: [
                                    Container(
                                      height: 300,
                                      child: PageView(
                                        children: pages,
                                        onPageChanged: (int page) {
                                          setState(() {
                                            controller.currentPageDot.value =
                                                page;
                                          });
                                        },
                                      ),
                                    ),
                                    DotsIndicator(
                                      dotsCount: pages.length,
                                      position: controller.currentPageDot.value
                                          .toDouble(),
                                      decorator: const DotsDecorator(
                                        color: Colors
                                            .grey, // Color of the inactive dots
                                        activeColor: Colors
                                            .blue, // Color of the active dot
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
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
                elevation: 0,
              )
            : PreferredSize(
                preferredSize: Size(0.0, 0.0),
                child: Container(),
              ),
        body: GestureDetector(
          onTap: () {
            controller.isAppBarVisible.value =
                !controller.isAppBarVisible.value;
          },
          child: PageView.builder(
            physics: BouncingScrollPhysics(),
           
            scrollDirection: Axis.horizontal,
            controller: controller.pageController,
            onPageChanged: (int page) {
              print("Page changed to: $page");
              controller.currentPage.value = page;
              print("_buildPages().length: ${_buildPages().length}");
            },
            // itemCount: _buildPages().length,
            itemBuilder: (context, index) {
              return _buildPages()[index];
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPages() {
    const int charactersPerPage = 900;

    List<String> pages = [];

    for (int i = 0;
        i < controller.extractedText.value.length;
        i += charactersPerPage) {
      int endIndex = i + charactersPerPage;
      endIndex = endIndex > controller.extractedText.value.length
          ? controller.extractedText.value.length
          : endIndex;
      pages.add(controller.extractedText.value.substring(i, endIndex));
    }
    List<Widget> pageWidgets = pages.map((page) {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 6, right: 8, left: 8, bottom: 8),
          child: Center(
              child: controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : Html(
                      data: controller.isBionicMode.value
                          ? page
                          : _applyBionicReadingMode(page),
                      style: {
                        "html": Style(
                          fontSize: FontSize(controller.textFontSize.value),
                          letterSpacing: controller.letterSpacing.value,
                          wordSpacing: controller.wordSpacing.value,
                          lineHeight: LineHeight(controller.letterHeight.value),
                          fontWeight: controller.availableFontWeights[
                              controller.fontWeightIndex.value],
                          color: controller.backgroundTheme.value ==
                                  AppColors.themeDark
                              ? AppColors.white
                              : AppColors.black,
                          fontFamily: controller.fontFamily.value,
                        ),
                      },
                    )),
        ),
      );
    }).toList();

    return pageWidgets;
  }

  String _applyBionicReadingMode(String text) {
    return text.split(" ").map((w) {
      return '<b>${w.substring(0, (w.length / 2).ceil())}</b>${w.substring((w.length / 2).ceil())} ';
    }).join();
  }
}
