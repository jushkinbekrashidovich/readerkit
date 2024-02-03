import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readerkit/app/const/custom_widgets/edit_font_view/small_classes/font_style_container.dart';
import 'package:readerkit/app/const/custom_widgets/edit_font_view/small_classes/theme_style_container.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';

class ThemeEditStyle extends StatelessWidget {
  const ThemeEditStyle({super.key, required this.themeDarkOntap, required this.themeCreamOntap, required this.themeBeigeOntap, required this.themeOffWhite, required this.styleBookerlyOntap, required this.styleCaecOntap, required this.styleAmazaonOntap, required this.styleNewsOntap, required this.styleBaskervilleOntap, required this.stylePalatinoOntap});

  final Function themeDarkOntap;
  final Function themeCreamOntap;
  final Function themeBeigeOntap;
  final Function themeOffWhite;
  final Function styleBookerlyOntap;
  final Function styleCaecOntap;
  final Function styleAmazaonOntap;
  final Function styleNewsOntap;
  final Function styleBaskervilleOntap;
  final Function stylePalatinoOntap;


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
              ontap: () {
                themeDarkOntap();
              },
              themeColor: AppColors.themeDark,
            ),
            ThemeStyleContainer(
              ontap: () {
                themeCreamOntap();

              },
              themeColor: AppColors.themeCream,
            ),
            ThemeStyleContainer(
              ontap: () {
                themeBeigeOntap();
              },
              themeColor: AppColors.themeBeige,
            ),
            ThemeStyleContainer(
              ontap: () {
                themeOffWhite();
              },
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
              onTap: () {
                styleBookerlyOntap();
              },
              fontFamily: 'Bookerly',
            ),
            FontStyleContainer(
              text: "Caecilia",
              onTap: () {
                styleCaecOntap();

              },
              fontFamily: 'Caec',
            ),
            FontStyleContainer(
              text: "Amazon Ember",
              onTap: () {
                styleAmazaonOntap();
              },
              fontFamily: 'AmazonEmber',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FontStyleContainer(
              text: "News Reader",
              onTap: () {
                styleNewsOntap();
              },
              fontFamily: 'News',
            ),
            FontStyleContainer(
              text: "Baskerville",
              onTap: () {
                styleBaskervilleOntap();

              },
              fontFamily: 'Baskervi',
            ),
            FontStyleContainer(
              text: "Palatino",
              onTap: () {
                stylePalatinoOntap();
              },
              fontFamily: 'Palatino',
            ),
          ],
        ),
      ],
    );
  }
}
