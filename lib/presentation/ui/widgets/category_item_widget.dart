import 'package:flutter/material.dart';
import 'package:flutter_ecommer_by_ostad/presentation/ui/screens/product_list_screen.dart';
import 'package:get/get.dart';
import '../utility/app_colors.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
    required this.categoryName,
  });

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(()=> ProductListScreen(categoryTitle: categoryName,));
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.primaryColor.withOpacity(.2),
            child: const Padding(
              padding: EdgeInsets.all(24),
              child: Icon(
                Icons.computer,
                size: 32,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Text(
            categoryName.toString(),
            style: const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
