import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';

import '../controllers/social_media_pages_controller.dart';

class SocialMediaPagesView extends GetView<SocialMediaPagesController> {
  const SocialMediaPagesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Follow us'),
        centerTitle: true,
        backgroundColor: AppColors.darkBackground,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(1),
        child: Column(
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
              tileColor: Color(0xff313036),
              leading: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: AppColors.mainColor),
                child: SvgPicture.asset(
                  "assets/icons/twitter.svg",
                  height: 19,
                ),
              ),
              title: Text(
                "Twitter",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            ListTile(
              
              tileColor: Color(0xff313036),
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
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
              onTap: () {},
            ),
             ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
              tileColor: Color(0xff313036),
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
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
