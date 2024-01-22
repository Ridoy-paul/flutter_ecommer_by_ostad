import 'package:flutter/material.dart';
import '../widgets/product_card_item.dart';
import 'package:get/get.dart';
import '../../state_holders/main_bottom_nav_controller.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
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
            onPressed: ()=> Get.find<MainBottomNavController>().backToHome(),
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
            child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: .8,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 4
                ),
                itemBuilder: (context, index) {
                  return FittedBox(child: ProductCardItem());
                }),
          ),
        ),
      ),
    );
  }
}
