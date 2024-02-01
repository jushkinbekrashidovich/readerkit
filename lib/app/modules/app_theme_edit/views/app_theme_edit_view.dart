import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';

import '../controllers/app_theme_edit_controller.dart';

class AppThemeEditView extends GetView<AppThemeEditController> {
  const AppThemeEditView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Theme'),
          centerTitle: true,
          backgroundColor: AppColors.darkBackground,
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          height: 90,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xff313036),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Light",
                    style: TextStyle(color: AppColors.white),
                  ),
                  Radio(value: 1, groupValue: 1, onChanged: (var 3){

                    1=3;
                  })
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Color.fromARGB(255, 77, 76, 83),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Dark",
                    style: TextStyle(color: AppColors.white),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
