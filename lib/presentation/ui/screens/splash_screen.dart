import 'package:flutter/material.dart';
import '../utility/assets_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(AssetsPath.logo, width: 110,),
            const Spacer(),
            const CircularProgressIndicator(),
            const SizedBox(height: 8,),
            const Text("Version 1.0"),
            const SizedBox(height: 25,),
          ],
        ),
      ),
    );
  }
}
