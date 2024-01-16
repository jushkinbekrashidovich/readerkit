import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readerkit/app/const/custom_widgets/edit_font_view/small_classes/font_details_row.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';

class FontEditStyle extends StatelessWidget {
  const FontEditStyle({super.key, required this.decreaseFontSizeOntap, required this.increaseFontSizeOntap, required this.textFontSize, required this.decreaseLetterSpacingOntap, required this.increaseLetterSpacingOntap, required this.textLetterSpacing, required this.decreaseFontWeightOntap, required this.increaseFontWeightOntap, required this.textFontWeight, required this.decreaseHeightOntap, required this.increaseHeightOntap, required this.textHeight, required this.decreaseWordSpacingOntap, required this.increaseWordSpacingOntap, required this.textWordSpacing,});
  
  final Function decreaseFontSizeOntap;
  final Function increaseFontSizeOntap;
  final String textFontSize;
  

  final Function decreaseLetterSpacingOntap;
  final Function increaseLetterSpacingOntap;
  final String textLetterSpacing;

  final Function decreaseWordSpacingOntap;
  final Function increaseWordSpacingOntap;
  final String textWordSpacing;

  final Function decreaseFontWeightOntap;
  final Function increaseFontWeightOntap;
  final String textFontWeight;

  final Function decreaseHeightOntap;
  final Function increaseHeightOntap;
  final String textHeight;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 13, right: 13),
          child: Text(
            "Font",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 18,
        ),
        FontDetailsRow(
          decreaseButtonOntap: () {
           decreaseFontSizeOntap();
          },
          increaseButtonOntap: () {
            increaseFontSizeOntap();
          },
          text: textFontSize,
          icon: CupertinoIcons.textformat_size,
        ),
        SizedBox(
          height: 12,
        ),
        FontDetailsRow(
          decreaseButtonOntap: () {
            decreaseLetterSpacingOntap();

          },
          increaseButtonOntap: () {
          increaseLetterSpacingOntap();
          },
          text: textLetterSpacing,
          icon: Icons.space_bar,
        ),
         SizedBox(
          height: 12,
        ),
        FontDetailsRow(
          decreaseButtonOntap: () {
            decreaseWordSpacingOntap();
          },
          increaseButtonOntap: () {
            increaseWordSpacingOntap();
          },
          text: textWordSpacing,
          icon: Icons.text_format,
        ),
        SizedBox(
          height: 12,
        ),
         FontDetailsRow(
          decreaseButtonOntap: () {
            decreaseFontWeightOntap();
          },
          increaseButtonOntap: () {
            increaseFontWeightOntap();
          },
          text: textFontWeight,
          icon: CupertinoIcons.bold,
        ),
        SizedBox(
          height: 12,
        ),
        FontDetailsRow(
          decreaseButtonOntap: () {
            decreaseHeightOntap();
          },
          increaseButtonOntap: () {
            increaseHeightOntap();
          },
          text: textHeight,
          icon: Icons.height,
        ),
       
      ],
    );
  }
}
