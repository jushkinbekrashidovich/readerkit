import 'package:get/get.dart';
import 'package:readerkit/app/data/book_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookDetailsController extends GetxController {
  
  @override
  void onInit() {
    super.onInit();
    
  }

  void toggleBookFinished(Book book) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int finishedBooks = prefs.getInt('finished_books') ?? 0;

    book.isFinished = !book.isFinished; // Toggle the finished state

    if (book.isFinished) {
      finishedBooks += 1; // Increment if the book is marked as finished
    } else {
      finishedBooks -= 1; // Decrement if the book is marked as not finished
    }
    await prefs.setInt('finished_books', finishedBooks); // Update shared preferences

    update(); // This is GetX's way to update UI, if you're using Rx variables or need to refresh UI after changing something.
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
