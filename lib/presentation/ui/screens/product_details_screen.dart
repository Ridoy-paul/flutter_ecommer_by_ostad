import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import '../utility/app_colors.dart';
import '../widgets/products/product_image_carosel_widget.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70,
          leading: IconButton(
            onPressed: ()=> Get.back(),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            'Product Details',
            style: TextStyle(fontSize: 18),
          ),
          elevation: 4,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    ProductImageCarouselWidget(),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text(
                                  "Happy New Year Special Deal Save 30% test product",
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              ItemCount(
                                color: AppColors.primaryColor,
                                initialValue: 2,
                                minValue: 1,
                                maxValue: 100,
                                decimalPlaces: 0,
                                onChanged: (v) {
                                  //noOfItem.value = v.toInt();
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              productDetailsBottomPriceSection,
            ],
          ),
        ),
      ),
    );
  }

  Container get productDetailsBottomPriceSection {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.16),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Text(
                  "\$10000.00",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Add To Cart"),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
