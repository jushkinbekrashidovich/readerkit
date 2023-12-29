import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';
import 'package:readerkit/app/modules/home/views/home_view.dart';
import 'package:readerkit/app/modules/settings/views/settings_view.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.bottomMenu.value.index,
          children: const [
           HomeView(),
           SettingsView()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: AppColors.white,
          selectedItemColor: AppColors.mainColor,
          onTap: (pos) {
            return controller.setMenu(BottomMenu.values[pos]);
          },
          currentIndex: controller.bottomMenu.value.index,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.darkBottomNavigation,
          selectedLabelStyle: TextStyle(
            fontSize: 10, fontWeight: FontWeight.w500
          ),
          unselectedLabelStyle:
              TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
          elevation: 7,
          items: [
            _bottomNavigationBarItem(
              icon: 'home',
              label: "Home",
              activeIcon: 'home_active',
            ),
            _bottomNavigationBarItem(
              icon: 'settings',
              label: "Settings".tr,
              activeIcon: 'settings_active',
            ),
          ],
        ),
      ),
    );
  }

  _bottomNavigationBarItem({
    required String activeIcon,
    required String icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      backgroundColor: AppColors.darkBackground,
      //backgroundColor: AppColors.white,
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: SizedBox(
            height: 22.5,
            width: 22.5,
            child: SvgPicture.asset('assets/svg/$icon.svg')),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: SizedBox(
            height: 22.5,
            width: 22.5,
            child: SvgPicture.asset('assets/svg/$activeIcon.svg')),
      ),
      label: label,
    );
  }
}
