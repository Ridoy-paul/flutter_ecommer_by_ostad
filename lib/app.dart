import 'package:flutter/material.dart';
import 'presentation/ui/screens/splash_screen.dart';

class ShoppersMart extends StatelessWidget {
  const ShoppersMart({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
