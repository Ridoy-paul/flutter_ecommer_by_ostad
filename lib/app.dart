import 'package:flutter/material.dart';
import 'presentation/state_holders/main_bottom_nav_controller.dart';
import 'presentation/ui/utility/app_theme_data.dart';
import 'package:get/get.dart';
import 'presentation/ui/screens/auth/splash_screen.dart';

class ShoppersMart extends StatelessWidget {
  const ShoppersMart({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: lightThemeData,
      home: const SplashScreen(),
    );
  }
}

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
  }
}
