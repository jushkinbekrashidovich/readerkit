import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';

import '../controllers/readerkit_pro_controller.dart';

class ReaderkitProView extends GetView<ReaderkitProController> {
  const ReaderkitProView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Readerkit Pro'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // Added for scrollable view
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
              const Text(
                'Make your reading immersive and faster with ReaderKit Pro!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.black,
                  fontWeight: FontWeight.w800
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Free",
                    style: TextStyle(color: AppColors.black, fontSize: 20),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Pro",
                    style: TextStyle(color: AppColors.black, fontSize: 20),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Customization"),
                    Row(
                      children: [
                        Icon(Icons.check, color: Colors.green),
                        SizedBox(
                          width: 30,
                        ),
                        Icon(Icons.check, color: Colors.green),
                      ],
                    ),
                  ],
                ),
              ),
              _buildFeatureComparison(),
              const SizedBox(height: 30),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.lightContainerColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Monthly",
                      style: TextStyle(color: AppColors.black),
                    ),
                    Container(
                      height: 40,
                      padding: EdgeInsets.all(9),
                      width: 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(6),topRight: Radius.circular(6), bottomLeft: Radius.circular(0)),
                          color: AppColors.mainColor),
                      child: Text(
                        "\$ 1.18",
                        style: TextStyle(color: AppColors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.lightContainerColor,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6,),bottomRight: Radius.circular(6)),
                ),
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Annual",
                      style: TextStyle(color: AppColors.black),
                    ),
                    Row(
                      children: [
                        Text(
                          "Save 50%!",
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 14.8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Container(
                          height: 40,
                          padding: EdgeInsets.all(9),
                          width: 90,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColors.mainColor),
                          child: Text(
                            "\$ 7.17",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You can cancel anytime"),
                  SizedBox(
                    height: 6,
                  ),
                  Text("or purchase")
                ],
              ),
              Divider(),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.lightContainerColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Lifetime",
                      style: TextStyle(color: AppColors.black),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          padding: EdgeInsets.all(9),
                          width: 90,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColors.mainColor),
                          child: Text(
                            "\$ 14.03",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
                  Text("Pay once, unlimited access forever!", textAlign: TextAlign.center,),
               
              SizedBox(
                height: 15,
              ),
              Text(
                "Already subscribed? Restore purchase",
                style: TextStyle(color: AppColors.mainColor, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureComparison() {
    return Column(
      children: const [
        FeatureTile(feature: 'Analytics', isPlus: true),
        FeatureTile(feature: 'Adding books without limits', isPlus: true),
        FeatureTile(feature: 'Bionic Reading', isPlus: true),
      ],
    );
  }
}

class FeatureTile extends StatelessWidget {
  final String feature;
  final bool isPlus;

  const FeatureTile({
    Key? key,
    required this.feature,
    this.isPlus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(feature),
          if (isPlus) const Icon(Icons.check, color: Colors.green),
        ],
      ),
    );
  }
}
