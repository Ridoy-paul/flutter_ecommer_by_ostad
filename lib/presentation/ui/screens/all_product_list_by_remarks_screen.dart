import 'package:flutter/material.dart';
import '../../state_holders/all_product_list_by_remarks_controller.dart';
import '../../../data/utility/helpers.dart';
import '../widgets/no_result_found_widget.dart';
import '../widgets/products/product_card_item.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class AllProductListByRemarksScreen extends StatefulWidget {
  const AllProductListByRemarksScreen({super.key, this.productTypeTitle,});

  final String? productTypeTitle;

  @override
  State<AllProductListByRemarksScreen> createState() => _AllProductListByRemarksScreenState();
}

class _AllProductListByRemarksScreenState extends State<AllProductListByRemarksScreen> {

  @override
  void initState() {
    super.initState();
    if(widget.productTypeTitle != null) {
      Get.find<AllProductListByRemarksController>().getProductList(widget.productTypeTitle!);
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
            '${widget.productTypeTitle} Products'.toUpperCase(),
            style: const TextStyle(fontSize: 18),
          ),
          elevation: 4,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            if(widget.productTypeTitle != null) {
              Get.find<AllProductListByRemarksController>().getProductList(widget.productTypeTitle!);
            }
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: GetBuilder<AllProductListByRemarksController>(builder: (allProductListByRemarksController) {
                return Visibility(
                  visible: !allProductListByRemarksController.inProgressStatus,
                  replacement: circleProgressIndicatorShow(),
                  child: Visibility(
                    replacement: const NoResultFoundWidget(),
                    visible: allProductListByRemarksController.productListModel.productList != null &&
                        allProductListByRemarksController.productListModel.productList!.isNotEmpty,
                    child: GridView.builder(
                      itemCount: allProductListByRemarksController.productListModel.productList?.length ?? 0,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.70,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                      ),
                      itemBuilder: (context, index) {
                        return FittedBox(
                          child: ProductCardItem(
                            productItem: allProductListByRemarksController.productListModel.productList![index],
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
