import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class OptionsRowWidget extends StatelessWidget {
const OptionsRowWidget({super.key, required this.iconName, required this.title, required this.subtitle, required this.iconSize, required this.textSize});
 
 final String iconName;
 final String title;
 final String subtitle;
 final double iconSize;
 final double textSize;

  @override
  Widget build(BuildContext context) {
    return Container(
          child: Row(
            children: [
              Container(
                height: 35,
                width: 35,
                margin: EdgeInsets.all(3),
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color.fromARGB(255, 254, 235, 186)),
                child: SvgPicture.asset(
                  "assets/svg/$iconName.svg",
                  height: iconSize,
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: textSize),
                  ),
                  Text(
                    subtitle,
                    style:
                        TextStyle(fontSize: 16.5, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        );
  }
}
