import 'package:flutter/material.dart';
import '../../state_holders/delete_cart_list_controller.dart';
import '../../../data/utility/helpers.dart';
import '../../state_holders/cart_list_controller.dart';
import '../utility/app_colors.dart';
import 'package:get/get.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../widgets/cart_product_item.dart';
import '../widgets/no_result_found_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  int totalPrice = 0;

  @override
  void initState() {
    super.initState();
    Get.find<CartListController>().getCartList();
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
            onPressed: () => Get.find<MainBottomNavController>().backToHome(),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            "Cart",
            style: TextStyle(fontSize: 18),
          ),
          elevation: 4,
        ),
        body: SafeArea(
          child: GetBuilder<CartListController>(builder: (controller) {
            if(controller.inProgressStatus) {
              return circleProgressIndicatorShow();
            }
            return Visibility(
              visible: !controller.inProgressStatus,
              replacement: circleProgressIndicatorShow(),
              child: Visibility(
                visible: controller.cartListModel.cartListItem!.isNotEmpty,
                replacement: const NoResultFoundWidget(),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.separated(
                          itemCount: controller.cartListModel.cartListItem?.length ?? 0,
                          itemBuilder: (context, index) {
                            return CartProductItem(
                              cartListItem: controller.cartListModel.cartListItem![index],
                              onRemoveCartItem: (bool isSuccess) async {
                                if(isSuccess) {
                                  final response = await Get.find<DeleteCartListController>().deleteCartListItem(controller.cartListModel.cartListItem![index].productId ?? 0);
                                }
                              },
                              cartItemSubtotal: (int itemSubtotal) {
                                totalPrice += itemSubtotal;
                              },
                            );
                          },
                          separatorBuilder: (_, __) =>
                          const SizedBox(
                            height: 5,
                          ),
                        ),
                      ),
                    ),
                    totalPriceAndCheckoutSection(totalPrice)
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Container totalPriceAndCheckoutSection(int totalP) {
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
                  "Total Price",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Text("\$$totalP",
                    style: const TextStyle(
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
                child: const Text("Checkout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


