import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:readerkit/app/const/custom_widgets/streak/badge_container.dart';
import 'package:readerkit/app/const/custom_widgets/streak/options_row.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';
import 'package:readerkit/app/routes/app_pages.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import '../controllers/streak_controller.dart';

class StreakView extends GetView<StreakController> {
  const StreakView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(CupertinoIcons.xmark),
            onPressed: () {
              Get.back();
            },
          ),
          title: const Text('Streak'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () async {
                // Capture the widget as an image
                final Uint8List? imageData =
                    await controller.screenshotController.capture();

                if (imageData != null) {
                  // Get temporary directory
                  final Directory tempDir = await getTemporaryDirectory();
                  // Create a file path
                  final String filePath = '${tempDir.path}/screenshot.png';
                  // Write the image bytes to the file
                  final File file = File(filePath);
                  await file.writeAsBytes(imageData);

                  // Share the file
                  await Share.shareFiles([filePath]);
                } else {
                  // Handle the case when 'imageData' is null
                  print('Failed to capture the image.');
                }
              },
              icon: Icon(CupertinoIcons.share),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 13, right: 13),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                Screenshot(
                    controller: controller.screenshotController,
                    child: Container(
                      height: 170,
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: context.isDarkMode
                            ? AppColors.darkContainerColor
                            : AppColors.lightContainerColor,
                      ),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                  height:
                                      20), // Adjust the height based on your content
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      OptionsRowWidget(
                                        title: "Reading time",
                                        subtitle: controller
                                                    .totalReadingTimeMinutes
                                                    .value <=
                                                59
                                            ? "${controller.totalReadingTimeMinutes.value} min"
                                            : "${controller.totalReadingTimeHours.value} h",
                                        iconName: "reading_time",
                                        iconSize: 18,
                                        textSize: 15,
                                      ),
                                      SizedBox(height: 18),
                                      OptionsRowWidget(
                                        title: "Finished books",
                                        subtitle: controller
                                            .totalFinishedBooks.value
                                            .toString(),
                                        iconName: "finished_books",
                                        iconSize: 15,
                                        textSize: 15,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      OptionsRowWidget(
                                        title: "Avg. pages",
                                        subtitle: controller
                                            .totalReadingTimeMinutes.value
                                            .toString(),
                                        iconName: "num_pages",
                                        iconSize: 15,
                                        textSize: 15,
                                      ),
                                      SizedBox(height: 18),
                                      OptionsRowWidget(
                                        title: "Num. Badges",
                                        subtitle: controller.badgeNumbers(),
                                        iconName: "num_badges",
                                        iconSize: 15,
                                        textSize: 15,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              padding: EdgeInsets.only(right: 12, bottom: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/logo_svg.svg",
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "ReaderKit",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.mainColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Badges",
                      style: TextStyle(fontSize: 19),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BadgeContainer(
                      function: controller.totalReadingTimeHours.value >= 1
                          ? () {
                              Get.toNamed(Routes.BADGE_DETAILS, arguments: {
                                "title": "Good Reader",
                                "time": "1",
                                "Icon": "good_reader"
                              });
                            }
                          : null,
                      colors: controller.totalReadingTimeHours.value >= 1
                          ? null
                          : Colors.grey,
                      iconName: "good_reader",
                      title: "Good Reader",
                      subtitle: "Read for 1 hour to unlock",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BadgeContainer(
                      function: controller.totalReadingTimeHours.value >= 5
                          ? () {
                            Get.toNamed(Routes.BADGE_DETAILS, arguments: {
                                "title": "Book Voyager",
                                "time": "5",
                                "Icon": "strong_reader"
                              });
                          }
                          : null,
                      colors: controller.totalReadingTimeHours.value >= 5
                          ? null
                          : Colors.grey,
                      iconName: "strong_reader",
                      title: "Book Voyager",
                      subtitle: "Read for 5 hours to unlock",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BadgeContainer(
                      function: controller.totalReadingTimeHours.value >= 10
                          ? () {
                            Get.toNamed(Routes.BADGE_DETAILS, arguments: {
                                "title": "Incredible Reader",
                                "time": "10",
                                "Icon": "incredible_reader"
                              });
                          }
                          : null,
                      colors: controller.totalReadingTimeHours.value >= 10
                          ? null
                          : Colors.grey,
                      iconName: "incredible_reader",
                      title: "Incredible Reader",
                      subtitle: "Read for 10 hours to unlock",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BadgeContainer(
                      function: controller.totalReadingTimeHours.value >= 20
                          ? () {
                             Get.toNamed(Routes.BADGE_DETAILS, arguments: {
                                "title": "Unstoppable Reader",
                                "time": "20",
                                "Icon": "unstoppable_reader"
                              });
                          }
                          : null,
                      colors: controller.totalReadingTimeHours.value >= 20
                          ? null
                          : Colors.grey,
                      iconName: "unstoppable_reader",
                      title: "Unstoppable Reader",
                      subtitle: "Read for 20 hours to unlock",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BadgeContainer(
                      function: controller.totalReadingTimeHours.value >= 50
                          ? () {
                            Get.toNamed(Routes.BADGE_DETAILS, arguments: {
                                "title": "Bookworm",
                                "time": "50",
                                "Icon": "bookworm"
                              });
                          }
                          : null,
                      colors: controller.totalReadingTimeHours.value >= 50
                          ? null
                          : Colors.grey,
                      iconName: "bookworm",
                      title: "Bookworm",
                      subtitle: "Read for 50 hours to unlock",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BadgeContainer(
                      function: controller.totalReadingTimeHours.value >= 100
                          ? () {
                            Get.toNamed(Routes.BADGE_DETAILS, arguments: {
                                "title": "Extreaordinary Reader",
                                "time": "100",
                                "Icon": "extraordinary_reader"
                              });
                          }
                          : null,
                      colors: controller.totalReadingTimeHours.value >= 100
                          ? null
                          : Colors.grey,
                      iconName: "extraordinary_reader",
                      title: "Extreaordinary Reader",
                      subtitle: "Read for 100 hours to unlock",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
