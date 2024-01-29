import 'package:flutter/material.dart';
import '../../state_holders/home_slider_controller.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import 'cart_screen.dart';
import 'category_screen.dart';
import 'home_screen.dart';
import 'wishlist_screen.dart';
import '../utility/app_colors.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    WishlistScreen(),
  ];

  @override
  void initState() {
    super.initState();
    Get.find<HomeSliderController>().getSliderList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(builder: (controller) {
      return Scaffold(
        body: _screens[controller.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.lightGray,
          showUnselectedLabels: true,
          onTap: (index) {
            controller.changeIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard), label: "Wish"),
          ],
        ),
      );
    });
  }
}
