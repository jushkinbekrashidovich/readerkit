import 'package:get/get.dart';

import '../modules/book_details/bindings/book_details_binding.dart';
import '../modules/book_details/views/book_details_view.dart';
import '../modules/book_view/bindings/book_view_binding.dart';
import '../modules/book_view/views/book_view_view.dart';
import '../modules/book_view_second/bindings/book_view_second_binding.dart';
import '../modules/book_view_second/views/book_view_second_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_DETAILS,
      page: () => const BookDetailsView(),
      binding: BookDetailsBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_VIEW,
      page: () => const BookViewView(),
      binding: BookViewBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_VIEW_SECOND,
      page: () => const BookViewSecondView(),
      binding: BookViewSecondBinding(),
    ),
  ];
}
