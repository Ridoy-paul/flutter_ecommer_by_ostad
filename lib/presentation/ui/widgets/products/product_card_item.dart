
import 'package:flutter/material.dart';
import '../../../../data/models/product_item.dart';
import '../../screens/product_details_screen.dart';
import 'package:get/get.dart';
import '../../utility/app_colors.dart';

class ProductCardItem extends StatelessWidget {
  ProductCardItem({
    super.key,
    required this.productItem,
  });

  ProductItem productItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetailsScreen());
      },
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: Get.width * .35,
       // height: Get.height * .24,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  productItem.image ?? '',
                  width: Get.width * .3,
                  height: 120,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productItem.title.toString() ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${productItem.price.toString() ?? ''}",
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        //const SizedBox(width: 5,),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(Icons.star, size: 12, color: Colors.amber,),
                            Text(
                              productItem.star.toString() ?? '',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          color: AppColors.primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(Icons.favorite_outline, size: 12, color: Colors.white,),
                          ),
                        ),
                        const SizedBox(width: 5,),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
