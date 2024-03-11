import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:screenshot/screenshot.dart';

class StreakController extends GetxController {
   RxInt totalReadingTimeHours = 0.obs;
   RxInt totalReadingTimeMinutes = 0.obs;
   RxInt totalFinishedBooks = 0.obs;

   ScreenshotController screenshotController = ScreenshotController();
   
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
    totalFinishedBooks.value = prefs.getInt('finished_books') ?? 0;
    print(totalTimeInSeconds.toString());
    print(totalReadingTimeMinutes.toString());
    print(totalReadingTimeHours.toString());
    print(prefs.get('finished_books').toString());
  }

  String badgeNumbers(){
    if(1 <= totalReadingTimeHours.value && totalReadingTimeHours.value < 5){
      return "1";
    }else if (5 <= totalReadingTimeHours.value && totalReadingTimeHours.value < 10){
      return "2";
    } else if(10 <= totalReadingTimeHours.value && totalReadingTimeHours.value < 20){
      return "3";
    } else if (20 <= totalReadingTimeHours.value && totalReadingTimeHours.value < 50){
      return "4";
    } else if (50 <= totalReadingTimeHours.value && totalReadingTimeHours.value < 100){
      return "5";
    } else if (100 <= totalReadingTimeHours.value){
      return "6";
    }
    return "0";
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
