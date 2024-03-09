import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StreakController extends GetxController {
   RxInt totalReadingTimeHours = 0.obs;
   RxInt totalReadingTimeMinutes = 0.obs;
   
  @override
  void onInit() {
    super.onInit();
    loadTotalReadingTime();

  }

   void loadTotalReadingTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int totalTimeInSeconds = prefs.getInt('totalReadingTime') ?? 0;
    totalReadingTimeHours.value = totalTimeInSeconds ~/ 3600; // Convert seconds to hours
    totalReadingTimeMinutes.value = totalTimeInSeconds ~/60;
    print(totalTimeInSeconds.toString());
    print(totalReadingTimeMinutes.toString());
    print(totalReadingTimeHours.toString());
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
