import 'package:flutter/material.dart';
import '../widgets/app_logo.dart';
import 'package:get/get.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: Get.height * .15,),
                const AppLogoWidget(),
                const SizedBox(height: 16,),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
