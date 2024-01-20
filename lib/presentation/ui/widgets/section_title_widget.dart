import 'package:flutter/material.dart';
import '../utility/app_colors.dart';

class SectionTitleWidget extends StatelessWidget {
  const SectionTitleWidget({
    super.key, required this.title, required this.onTapSeeAll,
  });

  final String title;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title.toString(), style: const TextStyle(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.w500),),
        TextButton(onPressed: onTapSeeAll, child: const Text("See All", style: TextStyle(color: AppColors.primaryColor),),)
      ],
    );
  }
}
