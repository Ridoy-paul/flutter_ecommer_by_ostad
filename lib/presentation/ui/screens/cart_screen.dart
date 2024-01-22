import 'package:flutter/material.dart';
import 'package:flutter_ecommer_by_ostad/presentation/ui/utility/app_colors.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../../state_holders/main_bottom_nav_controller.dart';

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
            icon: Icon(Icons.arrow_back_ios),
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
                child: Column(
                  children: [
                    Card(
                      color: Colors.white,
                      elevation: 2,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/shoe.png',
                            width: 120,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("New Year Special Shoe", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.gray),),
                                        Text("Color: Red, Size: x"),

                                      ],
                                    ),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.black54,))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text("\$1000", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.primaryColor),),
                                      ],
                                    ),
                                    ItemCount(
                                      initialValue: 0,
                                      minValue: 0,
                                      maxValue: 10,
                                      decimalPlaces: 0,
                                      onChanged: (value) {
                                        // Handle counter value changes
                                        print('Selected value: $value');
                                      },
                                    ),
                                  ],
                                ),


                              ],
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
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
