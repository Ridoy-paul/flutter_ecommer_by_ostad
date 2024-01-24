import 'package:flutter/material.dart';
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
                    Container(),
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
