import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:readerkit/app/const/custom_widgets/streak/badge_container.dart';
import 'package:readerkit/app/const/custom_widgets/streak/options_row.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';
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
                  final Directory tempDir =
                      (await controller.createTemporaryFile()) as Directory;
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
                    alignment: Alignment.center,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: context.isDarkMode
                          ? AppColors.darkContainerColor
                          : AppColors.lightContainerColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OptionsRowWidget(
                              title: "Reading time",
                              subtitle: controller.totalReadingTimeMinutes <= 59
                                  ? "${controller.totalReadingTimeMinutes} min"
                                  : "${controller.totalReadingTimeHours} h",
                              iconName: "reading_time",
                              iconSize: 13,
                              textSize: 12,
                            ),
                            OptionsRowWidget(
                              title: "Finished books",
                              subtitle: controller.totalFinishedBooks.value
                                  .toString(),
                              iconName: "finished_books",
                              iconSize: 13,
                              textSize: 12,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OptionsRowWidget(
                              title: "Avg. pages",
                              subtitle:
                                  controller.totalReadingTimeMinutes.toString(),
                              iconName: "num_pages",
                              iconSize: 13,
                              textSize: 12,
                            ),
                            OptionsRowWidget(
                              title: "Num. Badges",
                              subtitle: controller.badgeNumbers(),
                              iconName: "num_badges",
                              iconSize: 13,
                              textSize: 12,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: false,
                  child: Screenshot(
                    controller: controller.screenshotController,
                    child: Container(
                      alignment: Alignment.center,
                      height: 180,
                      width: 380,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: context.isDarkMode
                            ? AppColors.darkContainerColor
                            : AppColors.lightContainerColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              OptionsRowWidget(
                                title: "Reading Time",
                                subtitle: controller.totalReadingTimeMinutes <=
                                        59
                                    ? "${controller.totalReadingTimeMinutes} min"
                                    : "${controller.totalReadingTimeHours} h",
                                iconName: "reading_time",
                                iconSize: 36,
                                textSize: 18,
                              ),
                              SizedBox(height: 20),
                              OptionsRowWidget(
                                title: "Finished Books",
                                subtitle: controller.totalFinishedBooks.value
                                    .toString(),
                                iconName: "finished_books",
                                iconSize: 36,
                                textSize: 18,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              OptionsRowWidget(
                                title: "Avg. Pages",
                                subtitle: controller.totalReadingTimeMinutes
                                    .toString(),
                                iconName: "num_pages",
                                iconSize: 36,
                                textSize: 18,
                              ),
                              OptionsRowWidget(
                                title: "Num. Badges",
                                subtitle: controller.badgeNumbers(),
                                iconName: "num_badges",
                                iconSize: 36,
                                textSize: 18,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
                          ? () {}
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
                          ? () {}
                          : null,
                      colors: controller.totalReadingTimeHours.value >= 5
                          ? null
                          : Colors.grey,
                      iconName: "strong_reader",
                      title: "Strong Reader",
                      subtitle: "Read for 5 hours to unlock",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BadgeContainer(
                      function: controller.totalReadingTimeHours.value >= 10
                          ? () {}
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
                          ? () {}
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
                          ? () {}
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
                          ? () {}
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
