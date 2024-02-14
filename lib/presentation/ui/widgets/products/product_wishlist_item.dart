
import 'package:flutter/material.dart';
import '../../../../data/models/product_wishlist/product_wishlist_item_model.dart';
import '../../screens/product_details_screen.dart';
import 'package:get/get.dart';
import '../../utility/app_colors.dart';

class ProductWishlistItemScreen extends StatelessWidget {
  const ProductWishlistItemScreen({
    super.key,
    required this.productWishlistItem,
    required this.onDeletePressed,
  });

  final ProductWishlistItem productWishlistItem;

  final Function(bool) onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetailsScreen(productId: productWishlistItem.productId!));
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
                  productWishlistItem.product?.image ?? '',
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
                      productWishlistItem.product!.title.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${productWishlistItem.product!.price.toString()}",
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
                              productWishlistItem.product!.star.toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            onDeletePressed(true);
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            color: Colors.red,
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(Icons.delete_outlined, size: 12, color: Colors.white,),
                            ),
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
