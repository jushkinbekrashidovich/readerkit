import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';

class ThemeEditStyle extends StatelessWidget {
  const ThemeEditStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 28,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 13, right: 13),
          child: Text(
            "Theme",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.themeWhite,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Colors.blue,
                  width: 1,
                ),
              ),
              height: 39,
              width: 63,
            ),
            Container(
              margin: EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.themeDark,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Colors.blue,
                  width: 1,
                ),
              ),
              height: 39,
              width: 63,
            ),
            Container(
              margin: EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.themeCream,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Colors.blue,
                  width: 1,
                ),
              ),
              height: 39,
              width: 63,
            ),
            Container(
              margin: EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.themeBeige,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Colors.blue,
                  width: 1,
                ),
              ),
              height: 39,
              width: 63,
            ),
            
          ],
        ),
        SizedBox(
          height: 13,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 13, right: 13),
          child: Divider(
            thickness: 1.3,
          ),
        ),
        SizedBox(
          height: 13,
        ),
        Padding(
          padding: EdgeInsets.only(left: 13, right: 13),
          child: Text(
            "Style",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: Colors.blue,
                    width: 1,
                  ),
                ),
                height: 36,
                width: 70,
                child: Text(
                  "News Reader",
                  style: GoogleFonts.newsreader(
                    fontSize: 14,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: Colors.blue,
                    width: 1,
                  ),
                ),
                height: 36,
                width: 70,
                child: Text(
                  "Open Sans",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.black,
                    fontFamily: 'Bookerly',
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
