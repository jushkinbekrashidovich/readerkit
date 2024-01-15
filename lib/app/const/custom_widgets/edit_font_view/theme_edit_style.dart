import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readerkit/app/const/custom_widgets/edit_font_view/small_classes/font_style_container.dart';
import 'package:readerkit/app/const/custom_widgets/edit_font_view/small_classes/theme_style_container.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';

class ThemeEditStyle extends StatelessWidget {
  const ThemeEditStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 13, right: 13),
          child: Text(
            "Theme",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ThemeStyleContainer(
              ontap: () {},
              themeColor: AppColors.themeDark,
            ),
            ThemeStyleContainer(
              ontap: () {},
              themeColor: AppColors.themeCream,
            ),
            ThemeStyleContainer(
              ontap: () {},
              themeColor: AppColors.themeBeige,
            ),
            ThemeStyleContainer(
              ontap: () {},
              themeColor: AppColors.themeOffWhite,
            ),
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 13, right: 13),
          child: Divider(
            thickness: 1.3,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 13, right: 13),
          child: Text(
            "Style",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FontStyleContainer(
              text: "Bookerly",
              textColor: Colors.black,
              onTap: () {},
              fontFamily: 'Bookerly',
            ),
            FontStyleContainer(
              text: "Caecilia",
              textColor: Colors.black,
              onTap: () {},
              fontFamily: 'Caec',
            ),
            FontStyleContainer(
              text: "Amazon Ember",
              textColor: Colors.black,
              onTap: () {},
              fontFamily: 'AmazonEmber',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FontStyleContainer(
              text: "News Reader",
              textColor: Colors.black,
              onTap: () {},
              fontFamily: 'News',
            ),
            FontStyleContainer(
              text: "Baskerville",
              textColor: Colors.black,
              onTap: () {},
              fontFamily: 'Baskervi',
            ),
            FontStyleContainer(
              text: "Palatino",
              textColor: Colors.black,
              onTap: () {},
              fontFamily: 'Palatino',
            ),
          ],
        ),
      ],
    );
  }
}
