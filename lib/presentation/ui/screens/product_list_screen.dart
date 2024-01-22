import 'package:flutter/material.dart';
import '../widgets/product_card_item.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../widgets/category_item_widget.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, this.categoryTitle});

  final String? categoryTitle;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
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
          title: Text(
            widget.categoryTitle ?? 'Products',
            style: const TextStyle(fontSize: 18),
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
                    childAspectRatio: 0.70,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2
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
