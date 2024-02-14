import 'package:flutter/material.dart';
import 'package:flutter_ecommer_by_ostad/presentation/state_holders/wishlist/remove_product_wishlist_item_controller.dart';
import '../widgets/products/product_wishlist_item.dart';
import '../../../data/utility/helpers.dart';
import '../widgets/no_result_found_widget.dart';
import '../../state_holders/wishlist/product_wishlist_controller.dart';
import 'package:get/get.dart';
import '../../state_holders/main_bottom_nav_controller.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {

  @override
  void initState() {
    super.initState();
    Get.find<ProductWishlistController>().getWishlistItems();
  }

  @override
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
            onPressed: () => Get.find<MainBottomNavController>().backToHome(),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            "Wish List",
            style: TextStyle(fontSize: 18),
          ),
          elevation: 4,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            child: GetBuilder<ProductWishlistController>(builder: (controller) {
              if(controller.inProgressStatus) {
                return circleProgressIndicatorShow();
              }
              return Visibility(
                visible: !controller.inProgressStatus,
                replacement: circleProgressIndicatorShow(),
                child: Visibility(
                  visible: controller.productWishlistModel.productWishlistItem!.isNotEmpty,
                  replacement: const NoResultFoundWidget(),
                  child: GridView.builder(
                      itemCount: controller.productWishlistModel.productWishlistItem!.length ?? 0,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: .8,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 4
                      ),
                      itemBuilder: (context, index) {
                        return FittedBox(
                          child: ProductWishlistItemScreen(
                            productWishlistItem: controller.productWishlistModel.productWishlistItem![index],
                            onDeletePressed: (bool isDelete) async {
                              if(isDelete) {
                                await Get.find<RemoveProductWishlistItemController>().removeWishListItem(controller.productWishlistModel.productWishlistItem![index].productId ?? 0);
                              }
                            },
                          ),
                        );
                      },
                  ),
                ),
              );
            },),
          ),
        ),
      ),
    );
  }
}
