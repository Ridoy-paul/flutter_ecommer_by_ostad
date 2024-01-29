import 'package:flutter/material.dart';
import '../../../data/models/category_item.dart';
import '../screens/product_list_screen.dart';
import 'package:get/get.dart';
import '../utility/app_colors.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key, required this.categoryItem,
  });

  final CategoryItem categoryItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Get.to(()=> ProductListScreen(categoryTitle: categoryName,));
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.primaryColor.withOpacity(.2),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Image.network(categoryItem.categoryImg ?? '', width: 50, height: 50,),
            ),
          ),
          Text(
            categoryItem.categoryName.toString() ?? '',
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
