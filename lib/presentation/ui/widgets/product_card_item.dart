
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utility/app_colors.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * .3,
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
              child: Image.asset(
                'assets/images/shoe.png',
                width: Get.width * .3,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New year special shoe 30",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 4,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$120",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      //const SizedBox(width: 5,),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(Icons.star, size: 12, color: Colors.amber,),
                          Text(
                            "4.8",
                            style: TextStyle(
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
    );
  }
}
