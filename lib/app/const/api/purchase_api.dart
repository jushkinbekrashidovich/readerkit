import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PurchaseApi {
  static const _apiKey = 'goog_cRNAOaqlISpvLqdDbhVzhPhaCpd';

  static Future init() async {
    await Purchases.configure(PurchasesConfiguration(_apiKey));
  }

  static Future<List<Offering>> fetchOffers() async {
    try {
      final offerings = await Purchases.getOfferings();
      final current = offerings.current;

      return current == null ? [] : [current];
    } on PlatformException catch (e) {
      return [];
    }
  }

  static Future<bool> purchasePackage(Package package) async {
    try {
      final purchaserInfo = await Purchases.purchasePackage(package);
      if (purchaserInfo.entitlements.active.isNotEmpty) {
        return true;
      }
      return true;
    } catch (e) {
      return false;
    }
  }
   static Future<bool> isProUser() async {
    try {
      final purchaserInfo = await Purchases.getCustomerInfo();
      // Check if the user is subscribed to the pro version
      // For example:
      // return purchaserInfo.entitlements.all["pro_subscription"].isActive;
      return false; // Placeholder value, replace with actual logic
    } catch (e) {
      print("Error checking pro subscription: $e");
      return false;
    }
  }
}
