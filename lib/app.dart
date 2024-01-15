import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'presentation/ui/utility/app_colors.dart';
import 'presentation/ui/screens/splash_screen.dart';

class ShoppersMart extends StatelessWidget {
  const ShoppersMart({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: ThemeData(
        //primarySwatch: MaterialColor(AppColors.primaryColor.value, AppColors.colorSwatch),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.primaryColor,
        )
      ),
      home: SplashScreen(),
    );
  }
}
