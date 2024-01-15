
import 'package:flutter/material.dart';

class ThemeStyleContainer extends StatelessWidget {
  const ThemeStyleContainer({super.key, required this.ontap, required this.themeColor});

  final Function ontap;
  final Color themeColor;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: themeColor,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Colors.blue,
            width: 1,
          ),
        ),
        height: 39,
        width: 63,
      ),
    );
  }
}
