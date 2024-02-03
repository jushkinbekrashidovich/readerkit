
import 'package:flutter/material.dart';

class FontStyleContainer extends StatelessWidget {
  const FontStyleContainer(
      {super.key,
      required this.text,
      required this.onTap,
      required this.fontFamily});

  final String text;
  final Function onTap;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
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
          text,
          style: TextStyle(
            fontSize: 14,
            fontFamily: fontFamily,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
