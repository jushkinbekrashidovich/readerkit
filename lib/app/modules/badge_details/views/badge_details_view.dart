import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../controllers/badge_details_controller.dart';

class BadgeDetailsView extends GetView<BadgeDetailsController> {
  const BadgeDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('New Badge'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () async {
                final Uint8List? imageData =
                    await controller.screenshotController.capture();

                if (imageData != null) {
                  final Directory tempDir = await getTemporaryDirectory();

                  final String filePath = '${tempDir.path}/screenshotBadge.png';
                  final File file = File(filePath);
                  await file.writeAsBytes(imageData);

                  await Share.shareFiles([filePath]);
                } else {
                  print('Failed to capture the image.');
                }
              },
              icon: const Icon(CupertinoIcons.share),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Screenshot(
              controller: controller.screenshotController,
              child: Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.black),
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(6)),
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
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              "ReaderKit",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.mainColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(),
                        Text(
                          "${controller.badgeTitle} 🤓",
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColors.black,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(),
                        const SizedBox(),
                        const SizedBox(),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.readingTime.toString(),
                              style: TextStyle(
                                  fontSize: 80, color: AppColors.black),
                            ),
                            controller.badgeIcon == "good_reader"
                                ? Text(
                                    "hour of reading!",
                                    style: TextStyle(color: AppColors.black),
                                  )
                                : Text(
                                    "hours of reading!",
                                    style: TextStyle(color: AppColors.black),
                                  ),
                          ],
                        ),
                        controller.badgeIcon == "bookworm"?
                        SizedBox(
                          height: 180,
                          child: SvgPicture.asset(
                            "assets/svg/${controller.badgeIcon}.svg",
                            height: 100,
                          ),
                        ): SizedBox(
                          height: 180,
                          child: SvgPicture.asset(
                            "assets/svg/${controller.badgeIcon}.svg",
                            height: 160,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
