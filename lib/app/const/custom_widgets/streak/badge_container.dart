import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';

class BadgeContainer extends StatelessWidget {
   BadgeContainer(
      {super.key,
      required this.iconName,
      required this.title,
      required this.subtitle,
      required this.function,
      this.colors // Remove the default assignment
      });

  final String iconName;
  final String title;
  final String subtitle;
  final Function? function;
  final Color? colors; // Update Color to Color?

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function!();
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 5),
        padding: EdgeInsets.all(4),
        height: 78,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.darkContainerColor),
          // color:
          //     Colors.grey[300], // Adding a grey overlay to signify locked state
        ),
        child: Row(
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: SvgPicture.asset("assets/svg/$iconName.svg",
                  color: colors), // Grey out the badge icon
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 4,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 16, color: colors), // Grey out the text
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: colors),
                ), // Grey out the text
              ],
            ),
          ],
        ),
      ),
    );
  }
}
