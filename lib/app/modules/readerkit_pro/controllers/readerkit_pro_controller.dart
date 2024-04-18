import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purchases_flutter/models/offerings_wrapper.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:readerkit/app/const/api/purchase_api.dart';

class ReaderkitProController extends GetxController {
  RxList<Offering> offerings = <Offering>[].obs;
  List<Package> packages = [];
  RxBool isLoading = true.obs;

Future<void> fetchOffers() async {
    try {
      final fetchedOfferings = await PurchaseApi.fetchOffers();
      if (fetchedOfferings.isNotEmpty) {
        offerings.assignAll(fetchedOfferings);
        updatePackages();
      } else {
        print("No offerings found");
      }
    } catch (e) {
      print("Error fetching offerings $e");
    } finally {
      isLoading.value = false; // Set loading state to false after fetching
    }
  }

  void updatePackages() {
    packages = offerings
        .map((offer) => offer.availablePackages)
        .expand((pair) => pair)
        .toList();
  }

  @override
  void onInit() {
    super.onInit();
    fetchOffers();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
