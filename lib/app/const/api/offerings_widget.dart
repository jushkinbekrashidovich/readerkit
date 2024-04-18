import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';

class OfferingsWidget extends StatelessWidget {
  const OfferingsWidget(
      {super.key, required this.packages, required this.onClickedPackage});

  final List<Package> packages;
  final ValueChanged<Package> onClickedPackage;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: packages.length,
        itemBuilder: (context, index) {
          final package = packages[index];
          final product = package.storeProduct;
          return InkWell(
            onTap: () {
               onClickedPackage(package);
            },
            child: Container(
              
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.lightContainerColor,
                borderRadius: BorderRadius.circular(6),
              ),
              padding: EdgeInsets.only(left: 10, right: 10,),
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    child: 
                    Text(
                      product.title.split('(')[0].trim(),
                      style: TextStyle(color: AppColors.black, fontSize: 15),
                    ),
                  ),
                  Container(
                    height: 40,
                    padding: EdgeInsets.all(9),
                    width: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                            bottomLeft: Radius.circular(0)),
                        color: AppColors.mainColor),
                    child: Text(
                      product.priceString,
                      style: TextStyle(color: AppColors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        );
  }
}
