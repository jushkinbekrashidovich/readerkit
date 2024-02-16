import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/social_media_pages_controller.dart';

class SocialMediaPagesView extends GetView<SocialMediaPagesController> {
  const SocialMediaPagesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Follow us'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(1),
        child: Column(
          children: [
            ListTile(
                leading: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: AppColors.mainColor),
                  child: SvgPicture.asset(
                    "assets/icons/instagram.svg",
                    height: 19,
                  ),
                ),
                title: Text(
                  "Instagram",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                ),
                onTap: () async {
                  final Uri url = Uri.parse(
                      'https://www.instagram.com/readerkit.app/?igsh=MWwyNHVkMTAzdHVqdA%3D%3D');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch url');
                  }
                }),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
              leading: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: AppColors.mainColor),
                child: SvgPicture.asset(
                  "assets/icons/telegram.svg",
                  height: 19,
                ),
              ),
              title: Text(
                "Telegram",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
              ),
              onTap: () async {
                final Uri url = Uri.parse('https://t.me/ReaderKit');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch url');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
