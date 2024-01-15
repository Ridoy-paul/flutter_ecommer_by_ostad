import 'package:flutter/material.dart';
import 'presentation/ui/utility/app_theme_data.dart';
import 'package:get/get.dart';
import 'presentation/ui/screens/splash_screen.dart';

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
