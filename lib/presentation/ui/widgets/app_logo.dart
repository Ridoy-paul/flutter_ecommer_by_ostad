import 'package:flutter/material.dart';
import '../utility/assets_path.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsPath.logo, width: width ?? 120, height: height,);
  }
}
