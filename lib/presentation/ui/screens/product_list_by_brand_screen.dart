import 'package:flutter/material.dart';
import '../../state_holders/product_list_by_brand_controller.dart';
import '../../../data/utility/helpers.dart';
import '../widgets/no_result_found_widget.dart';
import '../widgets/products/product_card_item.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class ProductListByBrandScreen extends StatefulWidget {
  const ProductListByBrandScreen({super.key, this.brandTitle, required this.brandId});

  final String? brandTitle;
  final int? brandId;

  @override
  State<ProductListByBrandScreen> createState() => _ProductListByBrandScreenState();
}

class _ProductListByBrandScreenState extends State<ProductListByBrandScreen> {

  @override
  void initState() {
    super.initState();
    if(widget.brandId != null) {
      Get.find<ProductListByBrandController>().getProductList(widget.brandId!);
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
            widget.brandTitle ?? 'Products',
            style: const TextStyle(fontSize: 18),
          ),
          elevation: 4,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            if(widget.brandId != null) {
              Get.find<ProductListByBrandController>().getProductList(widget.brandId!);
            }
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: GetBuilder<ProductListByBrandController>(builder: (productListByBrandController) {
                return Visibility(
                  visible: !productListByBrandController.inProgressStatus,
                  replacement: circleProgressIndicatorShow(),
                  child: Visibility(
                    replacement: const NoResultFoundWidget(),
                    visible: productListByBrandController.productListModel.productList != null &&
                        productListByBrandController.productListModel.productList!.isNotEmpty,
                    child: GridView.builder(
                      itemCount: productListByBrandController.productListModel.productList?.length ?? 0,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.70,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                      ),
                      itemBuilder: (context, index) {
                        return FittedBox(
                          child: ProductCardItem(
                            productItem: productListByBrandController.productListModel.productList![index],
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
