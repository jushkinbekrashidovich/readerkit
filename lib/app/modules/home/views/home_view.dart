import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.darkBackground,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.star_fill,
                          size: 19,
                        )),
                    Text(
                      "102",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Container(
                  height: 21,
                  width: 21,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.white),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: AppColors.black,
                      size: 19,
                    ),
                  ),
                ),
              ],
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                height: 41,
                alignment: Alignment.center,
                child: TextFormField(
                  cursorColor: AppColors.mainColor,
                  focusNode: controller.myfocusNode,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: AppColors.mainColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: AppColors.mainColor,
                      ),
                    ),
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      color: AppColors.mainColor,
                      size: 16,
                    ),
                    fillColor: Color(0xFF313036),
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 12), // Adjust the vertical padding
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                height: 150,
                width: 119,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Color(0xFF3E3D43),
                ),
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.book,
                          color: AppColors.white,
                          size: 53,
                        ),
                        SizedBox(height: 2,),
                        Text(
                          'Your File'*10,
                          style: TextStyle(fontSize: 15, color: Colors.white)
                          ,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 13,
                          width: 47,
                          child: Text(
                            "23h left",
                            style:
                                TextStyle(fontSize: 11, color: Color(0xFFCCCCCC),
                                
                                ),
                                overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 17,
                          width: 35,
                          padding: EdgeInsets.only(
                              left: 5, right: 5, bottom: 2.4, top: 2.4),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Color(0xFF313036),
                          ),
                          child: Center(
                            child: Text(
                              '90%',
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xFFCCCCCC)),
                                  overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
