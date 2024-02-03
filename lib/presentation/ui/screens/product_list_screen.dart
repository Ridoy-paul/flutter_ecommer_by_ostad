import 'package:flutter/material.dart';
import '../../../data/utility/helpers.dart';
import '../../state_holders/product_list_by_category_controller.dart';
import '../widgets/no_result_found_widget.dart';
import '../widgets/products/product_card_item.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen(
      {super.key, this.categoryTitle, required this.categoryId});

  final String? categoryTitle;
  final int? categoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  void initState() {
    super.initState();
    if(widget.categoryId != null) {
      Get.find<ProductListByCategoryController>().getProductList(widget.categoryId!);
    }
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
          title: Text(
            widget.categoryTitle ?? 'Products',
            style: const TextStyle(fontSize: 18),
          ),
          elevation: 4,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            if(widget.categoryId != null) {
              Get.find<ProductListByCategoryController>().getProductList(widget.categoryId!);
            }
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: GetBuilder<ProductListByCategoryController>(builder: (controller) {
                return Visibility(
                  visible: !controller.inProgressStatus,
                  replacement: circleProgressIndicatorShow(),
                  child: controller.productListModel.productList!.isNotEmpty ?
                  GridView.builder(
                    itemCount:
                        controller.productListModel.productList?.length ?? 0,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.70,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2),
                    itemBuilder: (context, index) {
                      return FittedBox(
                        child: ProductCardItem(
                          productItem:
                              controller.productListModel.productList![index],
                        ),
                      );
                    },
                  ) : const NoResultFoundWidget(),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
