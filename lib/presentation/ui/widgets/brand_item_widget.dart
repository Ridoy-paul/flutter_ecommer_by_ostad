import 'package:flutter/material.dart';
import 'package:flutter_ecommer_by_ostad/data/models/brand_item.dart';
import 'package:flutter_ecommer_by_ostad/presentation/ui/screens/product_list_by_brand_screen.dart';
import '../../../data/models/category_item.dart';
import '../screens/product_list_screen.dart';
import 'package:get/get.dart';
import '../utility/app_colors.dart';

class BrandItemWidget extends StatelessWidget {
  const BrandItemWidget({
    super.key, required this.brandItem,
  });

  final BrandItem brandItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(()=>
            ProductListByBrandScreen(
              brandTitle: brandItem.brandName.toString(),
              brandId: int.parse(brandItem.id.toString()),
            ),
        );
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.primaryColor.withOpacity(.2),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Image.network(brandItem.brandImg ?? '', width: 50, height: 50,),
            ),
          ),
          Text(brandItem.brandName.toString() ?? '',
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
