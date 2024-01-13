import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';

import '../controllers/book_view_settings_controller.dart';

class BookViewSettingsView extends GetView<BookViewSettingsController> {
  const BookViewSettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.themeDark,
          title: Text(
            "Settings",
            style: TextStyle(fontSize: 17),
          ),
          elevation: 0,
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Speed reading'),
              Tab(text: 'Font'),
              Tab(text: 'Theme'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //Speed reading
            Column(
              children: [
                SizedBox(height: 55,),
                Container(
                  height: 70,
                  width: 70,
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
                        color: Colors.white, // Text color
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    
                  ],

                ),

            
              ],
            ),
            Center(
              child: Text('Font content'),
            ),
            Center(
              child: Text('Theme content'),
            ),
          ],
        ),
      ),
    );
  }
}
