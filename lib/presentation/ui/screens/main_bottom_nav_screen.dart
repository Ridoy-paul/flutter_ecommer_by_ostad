import 'package:flutter/material.dart';
import 'package:flutter_ecommer_by_ostad/presentation/state_holders/brand_list_controller.dart';
import 'package:flutter_ecommer_by_ostad/presentation/state_holders/category_list_controller.dart';
import 'package:flutter_ecommer_by_ostad/presentation/state_holders/new_product_list_controller.dart';
import 'package:flutter_ecommer_by_ostad/presentation/state_holders/popular_product_list_controller.dart';
import 'package:flutter_ecommer_by_ostad/presentation/state_holders/special_product_list_controller.dart';
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
    //WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      Get.find<HomeSliderController>().getSliderList();
      Get.find<CategoryListController>().getCategoryList();
      Get.find<PopularProductListController>().getProductList();
      Get.find<SpecialProductListController>().getProductList();
      Get.find<NewProductListController>().getProductList();
      Get.find<BrandListController>().getBrandList();
    //});
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
