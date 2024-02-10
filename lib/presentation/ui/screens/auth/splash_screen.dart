import 'package:flutter/material.dart';
import '../../../state_holders/auth/auth_controller.dart';
import '../main_bottom_nav_screen.dart';
import 'verify_email_screen.dart';
import 'package:get/get.dart';
import '../../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    moveToNextScreen();
    super.initState();
  }

  void moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 1));
    final bool isLoggedIn = await Get.find<AuthController>().isLoggedIn();
    if(isLoggedIn) {
      Get.offAll(() => const MainBottomNavScreen());
    }
    else {
      Get.offAll(() => const VerifyEmailScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            AppLogoWidget(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 8,),
            Text("Version 1.0"),
            SizedBox(height: 25,),
          ],
        ),
      ),
    );
  }
}
