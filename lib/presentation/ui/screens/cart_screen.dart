import 'package:flutter/material.dart';
import '../utility/app_colors.dart';
import 'package:get/get.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../widgets/cart_product_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

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
            onPressed: ()=> Get.find<MainBottomNavController>().backToHome(),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            "Cart",
            style: TextStyle(fontSize: 18),
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
              totalPriceAndCheckoutSection
            ],
          ),
        ),
      ),
    );
  }

  Container get totalPriceAndCheckoutSection {
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
                Text("\$10000.00",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor)),
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


