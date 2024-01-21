import 'package:flutter/material.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../widgets/category_item_widget.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
          title: Text(
            "Categories",
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
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 8
                ),
                itemBuilder: (context, index) {
                  return FittedBox(child: CategoryItemWidget(categoryName: "Fish"));
                }),
          ),
        ),
      ),
    );
  }
}
