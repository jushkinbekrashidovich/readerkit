import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        backgroundColor: AppColors.darkBackground,
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
              tileColor: Color(0xff313036),
              leading: Icon(
                Icons.workspace_premium,
                color: Colors.white,
              ),
              title: Text(
                "Theme",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
            ),
            ListTile(
           
              tileColor: Color(0xff313036),
              leading: Icon(
                Icons.workspace_premium,
                color: Colors.white,
              ),
              title: Text(
                "Rate the app",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
            ),
            ListTile(
                
              tileColor: Color(0xff313036),
              leading: Icon(
                Icons.workspace_premium,
                color: Colors.white,
              ),
              title: Text(
                "Follow us on social media",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
            ),
            ListTile(
              tileColor: Color(0xff313036),
              leading: Icon(
                Icons.workspace_premium,
                color: Colors.white,
              ),
              title: Text(
                "Privacy policy",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
            ),
            ListTile(
              tileColor: Color(0xff313036),
              leading: Icon(
                Icons.workspace_premium,
                color: Colors.white,
              ),
              title: Text(
                "Terms and use",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
              tileColor: Color(0xff313036),
              leading: Icon(
                Icons.workspace_premium,
                color: Colors.white,
              ),
              title: Text(
                "Send feedback",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
