import 'package:flutter/material.dart';
import '../../../data/utility/helpers.dart';
import '../widgets/products/product_review_item_widget.dart';
import '../../state_holders/list_review_by_product_controller.dart';
import 'create_product_review_screen.dart';
import '../utility/app_colors.dart';
import 'package:get/get.dart';
import '../../state_holders/main_bottom_nav_controller.dart';

class ProductReviewListsScreen extends StatefulWidget {
  const ProductReviewListsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductReviewListsScreen> createState() => _ProductReviewListsScreenState();
}

class _ProductReviewListsScreenState extends State<ProductReviewListsScreen> {

  @override
  void initState() {
    super.initState();
    Get.find<ListReviewByProductController>().getReviewList(widget.productId);
  }

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
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            "Reviews",
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
          elevation: 4,
        ),
        body: SafeArea(
          child: GetBuilder<ListReviewByProductController>(builder: (controller) {
            if(controller.inProgressStatus) {
              return circleProgressIndicatorShow();
            }
            return Visibility(
              visible: !controller.inProgressStatus,
              replacement: circleProgressIndicatorShow(),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ListView.separated(
                        itemCount: controller.listReviewByProductModel.productReviewItem!.length ?? 0,
                        itemBuilder: (context, index) {
                          return ProductReviewItemWidget(productReviewItem: controller.listReviewByProductModel.productReviewItem![index]);
                        },
                        separatorBuilder: (_, __) =>
                        const SizedBox(
                          height: 5,
                        ),
                      ),
                    ),
                  ),
                  totalReviewAndAddReviewButtonSection(controller.listItemQty)
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Container totalReviewAndAddReviewButtonSection(int listItemQty) {
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
                Text(
                  "Reviews(${listItemQty ?? 0})",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                  Get.to(() => CreateProductReviewScreen(productId: widget.productId,));
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


