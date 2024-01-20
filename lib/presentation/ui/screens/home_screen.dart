import 'package:flutter/material.dart';
import 'package:flutter_ecommer_by_ostad/presentation/ui/utility/app_colors.dart';
import 'package:flutter_ecommer_by_ostad/presentation/ui/utility/assets_path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AssetsPath.logoNav),
        actions: [
          CircleIconButton(
            onTap: () {
              print("hello");
            },
            iconData: Icons.card_giftcard,
          ),
          const SizedBox(
            width: 4,
          ),
          CircleIconButton(
            onTap: () {
              print("hello");
            },
            iconData: Icons.call_outlined,
          ),
          const SizedBox(
            width: 4,
          ),
          CircleIconButton(
            onTap: () {
              print("hello");
            },
            iconData: Icons.notification_important_outlined,
          ),
          const SizedBox(
            width: 4,
          ),
        ],
      ),
    );
  }
}

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key, required this.onTap, required this.iconData,
  });

  final VoidCallback onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: CircleAvatar(
        backgroundColor: Colors.black12,
        foregroundColor: AppColors.primaryColor,
        child: Icon(iconData),
      ),
    );
  }
}
