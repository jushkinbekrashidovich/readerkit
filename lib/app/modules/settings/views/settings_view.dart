import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readerkit/app/routes/app_pages.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 12, right: 12, bottom: 10),
        child: Column(
          children: [
            // ListTile(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(8),
            //   ),
            //   visualDensity: VisualDensity(vertical: -2),
            //   tileColor: Color(0xff313036),
            //   leading: Icon(
            //     Icons.workspace_premium,
            //     color: Colors.white,
            //   ),
            //   title: Text(
            //     "Subscribe to ReaderKit Pro",
            //     style: TextStyle(fontSize: 14, color: Colors.white),
            //   ),
            //   subtitle: Text(
            //     "Unlimited books, no ads",
            //     style: TextStyle(fontSize: 10, color: Colors.white),
            //   ),
            //   trailing: Icon(
            //     Icons.chevron_right,
            //     color: Colors.white,
            //   ),
            // ),
            SizedBox(
              height: 15,
            ),

            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
            
              leading: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: AppColors.mainColor),
                child: SvgPicture.asset(
                  "assets/icons/bulb.svg",
                  height: 19,
                ),
              ),
              title: Text(
                "Theme",
                style: TextStyle(fontSize: 14, ),
              ),
              trailing: Icon(
                Icons.chevron_right,
              ),
              onTap: (){
                Get.toNamed(Routes.APP_THEME_EDIT);
              },
            ),
            ListTile(
             
              leading: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: AppColors.mainColor),
                child: SvgPicture.asset(
                  "assets/icons/rate.svg",
                  height: 19,
                ),
              ),
              title: Text(
                "Rate the app",
                style: TextStyle(fontSize: 14,),
              ),
              trailing: Icon(
                Icons.chevron_right,
              ),
              onTap: (){

              },
            ),
            ListTile(
             
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
                "Follow us on social media",
                style: TextStyle(fontSize: 14, ),
              ),
              trailing: Icon(
                Icons.chevron_right,
              ),
              onTap: (){
                Get.toNamed(Routes.SOCIAL_MEDIA_PAGES);
              },
            ),
            ListTile(
             
              leading: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: AppColors.mainColor),
                child: SvgPicture.asset(
                  "assets/icons/privacy_policy.svg",
                  height: 19,
                ),
              ),
              title: Text(
                "Privacy policy",
                style: TextStyle(fontSize: 14, ),
              ),
              trailing: Icon(
                Icons.chevron_right,
              ),
              onTap: (){
                Get.toNamed(Routes.PRIVACY_POLICY);
              },
            ),
            ListTile(
             
              leading: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: AppColors.mainColor),
                child: SvgPicture.asset(
                  "assets/icons/terms.svg",
                  height: 19,
                ),
              ),
              title: Text(
                "Terms and use",
                style: TextStyle(fontSize: 14, ),
              ),
              trailing: Icon(
                Icons.chevron_right,
              ),
              onTap: (){
                Get.toNamed(Routes.TERMS_AND_USE);
              },
            ),
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
                  "assets/icons/feedback.svg",
                  height: 19,
                ),
              ),
              title: Text(
                "Send feedback",
                style: TextStyle(fontSize: 14, ),
              ),
              trailing: Icon(
                Icons.chevron_right,
              ),
              onTap: (){
                
              },
            ),
          ],
        ),
      ),
    );
  }
}
