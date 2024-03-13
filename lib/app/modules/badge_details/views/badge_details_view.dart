import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';

import '../controllers/badge_details_controller.dart';

class BadgeDetailsView extends GetView<BadgeDetailsController> {
  const BadgeDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Badge'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(9),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.black),
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/logo_svg.svg",
                          height: 15,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "ReaderKit",
                          style: TextStyle(
                              fontSize: 12,
                              color: AppColors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Text(
                      "Badge",
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "50",
                          style:
                              TextStyle(fontSize: 80, color: AppColors.black),
                        ),
                        Text(
                          "hours of reading!",
                          style: TextStyle(color: AppColors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 180,
                      child: SvgPicture.asset(
                        "assets/svg/good_reader.svg",
                        height: 160,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.darkContainerColor),
                  height: 70,
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        'assets/star.svg',
                        height: 30,
                      ),
                      Text(
                        "Congratulations!🎉 \n You've earned a new badge!",
                        style:
                            TextStyle(fontSize: 14.3, color: AppColors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
