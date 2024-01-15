import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utility/assets_path.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: Get.height * .15,),
              Image.asset(AssetsPath.logo, width: 110,),
            ],
          ),
        ),
      ),
    );
  }
}
