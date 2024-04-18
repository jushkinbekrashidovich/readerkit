import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readerkit/app/const/api/purchase_api.dart';
import 'package:readerkit/app/const/rating_service.dart';
import 'package:readerkit/app/data/book_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  RxList<Book> books = <Book>[].obs;
  late final FocusNode myfocusNode;

  final RatingService _ratingService = RatingService();

  @override
  void onInit() {
    Timer(const Duration(seconds: 2), () {
      _ratingService.isSecondTimeOpen().then((secondOpen) {
        if (secondOpen) {
          _ratingService.showRating();
        }
      });
    });

    myfocusNode = FocusNode();
    super.onInit();
    loadBooks();
  }

  Future<void> loadBooks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? bookJsonList = prefs.getStringList('books');

    if (bookJsonList != null) {
      books.assignAll(
          bookJsonList.map((json) => Book.fromJson(jsonDecode(json))).toList());
    }
  }

  Future<void> addBook() async {
    if (await PurchaseApi.isProUser() || books.length < 5) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any, // Allow any type of file
      );

      if (result != null) {
        String path = result.files.single.path!;
        String fileName = result.files.single.name;
        String format = fileName.split('.').last.toLowerCase();
        File file = File(path);
        int pdfSize = await file.length();
        books.add(Book(
            title: fileName,
            path: path,
            pageNumber: 1,
            format: format,
            pdfSize: pdfSize,
            isFinished: false));

        SharedPreferences prefs = await SharedPreferences.getInstance();
        List<String> bookJsonList =
            books.map((book) => jsonEncode(book.toJson())).toList();
        prefs.setStringList('books', bookJsonList);
      }
    } else {
      Get.snackbar("Subscribe pls", "Subscribe to ReaderKit pro");
    }
  }

  Future<void> deleteBook(Book book) async {
    // Remove the book from the list
    books.remove(book);

    // Update local storage after removing the book
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> bookJsonList =
        books.map((book) => jsonEncode(book.toJson())).toList();
    prefs.setStringList('books', bookJsonList);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myfocusNode.dispose();
  }
}
