import 'package:flutter/cupertino.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';

class FontDetailsRow extends StatelessWidget {
  const FontDetailsRow({super.key, required this.decreaseButtonOntap, required this.increaseButtonOntap, required this.text, required this.icon,});
  final Function decreaseButtonOntap;
  final Function increaseButtonOntap;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: (){
            decreaseButtonOntap();
          },
          child: Container(
            height: 34,
            width: 59,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.2),
                color: AppColors.themeDark),
            child: Icon(
              icon,
              size: 18,
              color: AppColors.white,
            ),
          ),
        ),
        Text(
        text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        GestureDetector(
          onTap: (){
            increaseButtonOntap();
          },
          child: Container(
            height: 34,
            width: 59,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.2),
                color: AppColors.themeDark),
            child: Icon(
              icon,
              size: 25,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
