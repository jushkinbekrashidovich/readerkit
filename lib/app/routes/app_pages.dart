import 'package:get/get.dart';

import '../modules/app_theme_edit/bindings/app_theme_edit_binding.dart';
import '../modules/app_theme_edit/views/app_theme_edit_view.dart';
import '../modules/book_details/bindings/book_details_binding.dart';
import '../modules/book_details/views/book_details_view.dart';
import '../modules/book_view_second/bindings/book_view_second_binding.dart';
import '../modules/book_view_second/views/book_view_second_view.dart';
import '../modules/book_view_third/bindings/book_view_third_binding.dart';
import '../modules/book_view_third/views/book_view_third_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/social_media_pages/bindings/social_media_pages_binding.dart';
import '../modules/social_media_pages/views/social_media_pages_view.dart';
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
      name: _Paths.BOOK_VIEW_SECOND,
      page: () => const BookViewSecondView(),
      binding: BookViewSecondBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_VIEW_THIRD,
      page: () => BookViewThirdView(),
      binding: BookViewThirdBinding(),
    ),
    GetPage(
      name: _Paths.APP_THEME_EDIT,
      page: () => const AppThemeEditView(),
      binding: AppThemeEditBinding(),
    ),
    GetPage(
      name: _Paths.SOCIAL_MEDIA_PAGES,
      page: () => const SocialMediaPagesView(),
      binding: SocialMediaPagesBinding(),
    ),
    
   
  ];
}
