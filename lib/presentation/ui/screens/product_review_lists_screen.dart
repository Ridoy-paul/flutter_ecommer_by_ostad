import 'package:flutter/material.dart';
import 'create_product_review_screen.dart';
import '../utility/app_colors.dart';
import 'package:get/get.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../widgets/cart_product_item.dart';

class ProductReviewListsScreen extends StatefulWidget {
  const ProductReviewListsScreen({super.key});

  @override
  State<ProductReviewListsScreen> createState() => _ProductReviewListsScreenState();
}

class _ProductReviewListsScreenState extends State<ProductReviewListsScreen> {

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: ()=> Get.back(),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            "Reviews",
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
          elevation: 4,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return CartProductItem();
                    },
                    separatorBuilder: (_, __) => const SizedBox(
                      height: 5,
                    ),
                  ),
                ),
              ),
              totalReviewAndAddReviewButtonSection
            ],
          ),
        ),
      ),
    );
  }

  Container get totalReviewAndAddReviewButtonSection {
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Reviews(1000)",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Card(
              color: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                color: Colors.white,
                onPressed: () {
                  Get.to(() => CreateProductReviewScreen());
                },
                icon: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


