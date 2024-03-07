import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:readerkit/app/const/custom_widgets/streak/options_row.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';
import '../controllers/streak_controller.dart';

class StreakView extends GetView<StreakController> {
  const StreakView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.share)),
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
              Container(
                alignment: Alignment.center,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.darkContainerColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OptionsRowWidget(
                          title: "Reading time",
                          subtitle: "12h",
                          iconName: "fire",
                        ),
                         OptionsRowWidget(
                          title: "Finished books",
                          subtitle: "12",
                          iconName: "fire",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         OptionsRowWidget(
                          title: "Avg. pages",
                          subtitle: "122",
                          iconName: "fire",
                        ),
                        OptionsRowWidget(
                          title: "Num. Badges",
                          subtitle: "12",
                          iconName: "fire",
                        ),
                      ],
                    ),
                  ],
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
                  Container(
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.lock),
                        Column(
                          children: [Text("Good Reader"), Text("ssmmsm")],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
