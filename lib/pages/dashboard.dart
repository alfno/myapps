import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:myapps/controllers/dashboard_controller.dart';
import 'package:myapps/pages/menu/coming_soon_menu.dart';
import 'package:myapps/pages/menu/home_menu.dart';
import 'package:myapps/pages/menu/profile_menu.dart';
import 'package:myapps/widget/mycolor.dart';



class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = Get.find();

    final List<Widget> menus = [HomeMenu(), ComingSoonMenu(), ProfileMenu()];

    return Obx(() {
      return Scaffold(
        body: menus[dashboardController.selectedIndex.value],
        bottomNavigationBar: CurvedNavigationBar(
          index: dashboardController.selectedIndex.value,
          onTap: dashboardController.changeMenu,
          backgroundColor: Colors.transparent, 
          color: MyColor.backgroundColor2, 
          buttonBackgroundColor: MyColor.selectedItemColor, 
          items: const [
            Icon(Icons.movie_creation, size: 30, color: Colors.white),
            Icon(Icons.play_circle_fill, size: 30, color: Colors.white),
            Icon(Icons.person, size: 30, color: Colors.white),
          ],
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
        ),
      );
    });
  }
}
