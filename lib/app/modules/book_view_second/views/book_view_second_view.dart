
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';
import 'package:readerkit/app/modules/book_view_second/controllers/book_view_second_controller.dart';


class BookViewSecondView extends GetView<BookViewSecondController> {
  const BookViewSecondView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.themeCream,
        appBar: AppBar(
          toolbarHeight: 39,
          leadingWidth: 8,
          backgroundColor: AppColors.themeDark,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 20,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(2)),
                child: Text(
                  "Speed",
                  style: GoogleFonts.urbanist(fontSize: 13, color: Colors.blue),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: (){
                  controller.isBionicMode.value =! controller.isBionicMode.value;
                },
                child: Container(
                  height: 20,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(2)),
                  child: Text(
                    controller.isBionicMode.value ? "Standard" : "Bionic",
                    style: GoogleFonts.urbanist(fontSize: 13, color: Colors.blue),
                  ),
                ),
              ),
             const SizedBox(
                width: 30,
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
                        builder: (BuildContext context, StateSetter setState) {
                          List<Widget> pages = [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 28,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 13, right: 13),
                                  child: Text(
                                    "Theme",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  height: 57,
                                  padding: EdgeInsets.only(left: 3),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 6,
                                    itemBuilder: (context, index) {
                                      Color containerColor = controller
                                              .colorList[
                                          index % controller.colorList.length];

                                      return GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          margin: EdgeInsets.all(8),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: containerColor,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                              color: Colors.blue,
                                              width: 1,
                                            ),
                                          ),
                                          height: 52,
                                          width: 87,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 13,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 13, right: 13),
                                  child: Divider(
                                    thickness: 1.3,
                                  ),
                                ),
                                SizedBox(
                                  height: 13,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 13, right: 13),
                                  child: Text(
                                    "Style",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  height: 62,
                                  padding: EdgeInsets.only(left: 3),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.fontStyles.length,
                                    itemBuilder: (context, index) {
                                      String fontStyleName =
                                          controller.fontStyles[index];

                                      return GestureDetector(
                                        onTap: () {
                                          // Handle onTap event here
                                          print('$fontStyleName selected');
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(8),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                              color: Colors.blue,
                                              width: 1,
                                            ),
                                          ),
                                          height: 42,
                                          width: 87,
                                          child: Text(
                                            fontStyleName,
                                            style: GoogleFonts.getFont(
                                              fontStyleName,
                                              fontSize: 14,
                                              color: AppColors.black,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),

                            //font style
                            //font family
                            Column(
                              children: [
                                SizedBox(
                                  height: 28,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 13, right: 13),
                                  child: Text(
                                    "Font",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                ),
                                
                                SizedBox(height: 30,),
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
                                        CupertinoIcons.textformat_size,
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
                                        CupertinoIcons.textformat_size,
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
                                        Icons.space_bar,
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
                                        Icons.space_bar,
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
                                        Icons.text_fields,
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
                                        Icons.text_fields,
                                        size: 25,
                                        color: AppColors.white,
                                        weight: 3,
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
                                        Icons.height,
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
                                        Icons.height,
                                        size: 25,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
                                      fontWeight: FontWeight.w500),
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

                          int currentPage = 0; // Track the current page index

                          return Column(
                            children: [
                              Container(
                                height: 300,
                                child: PageView(
                                  children: pages,
                                  onPageChanged: (int page) {
                                    // Update the current page when the page changes

                                    setState(() {
                                      controller.currentPage.value = page;
                                    });
                                  },
                                ),
                              ),
                              DotsIndicator(
                                dotsCount: pages.length,
                                position:
                                    controller.currentPage.value.toDouble(),
                                decorator: const DotsDecorator(
                                  color:
                                      Colors.grey, // Color of the inactive dots
                                  activeColor:
                                      Colors.blue, // Color of the active dot
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
        ),
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 6, right: 8, left: 8, bottom: 8),
              child: Center(
                child: controller.isLoading.value
                    ? CircularProgressIndicator()
                    : HtmlWidget(
                      controller.extractedText.value, 
                        textStyle: GoogleFonts.newsreader(
                          fontSize: 18,
                          letterSpacing: 0.5,
                          height: 1.2,
                          color: AppColors.black,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
