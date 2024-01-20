import 'package:flutter/material.dart';
import '../../utility/app_colors.dart';

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
