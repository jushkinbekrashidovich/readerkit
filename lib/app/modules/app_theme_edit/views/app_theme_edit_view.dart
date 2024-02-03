import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';

import '../controllers/app_theme_edit_controller.dart';

class AppThemeEditView extends GetView<AppThemeEditController> {
  const AppThemeEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Theme'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          height: 135,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Get.isDarkMode
                ? AppColors.darkContainerColor
                : Color(0xFFE0E0E0)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Light",
                  ),
                  Radio(
                    value: ThemeType.light,
                    groupValue: controller.selectedTheme.value,
                    onChanged: (value) {
                      controller.changeTheme(value!);
                      print(context.isDarkMode);
                    },
                  )
                ],
              ),
              Divider(
                color: Color.fromARGB(255, 77, 76, 83),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dark",
                  ),
                  Radio(
                    value: ThemeType.dark,
                    groupValue: controller.selectedTheme.value,
                    onChanged: (value) {
                      controller.changeTheme(value!);
                      print(context.isDarkMode);
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
