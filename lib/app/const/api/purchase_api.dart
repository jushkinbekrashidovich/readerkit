import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
class PurchaseApi {

  static const _apiKey = 'goog_cRNAOaqlISpvLqdDbhVzhPhaCpd';

  static Future init() async {
    await Purchases.configure(PurchasesConfiguration(_apiKey));
  }

  static Future<List<Offering>> fetchOffers() async{
   
   try { final offerings = await Purchases.getOfferings();
    final current = offerings.current;

    return current == null ? [] :[current];
  } on PlatformException catch(e){
    return [];
  }
  }

  
  static Future<bool> purchasePackage(Package package) async {
   try{ 
    await PurchaseApi.purchasePackage(package);

    return true;
  } catch(e){
    return false;
  }
  }
}