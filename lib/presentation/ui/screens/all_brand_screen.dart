import 'package:flutter/material.dart';
import '../../state_holders/brand_list_controller.dart';
import '../widgets/brand_item_widget.dart';
import '../../../data/utility/helpers.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class AllBrandScreen extends StatefulWidget {
  const AllBrandScreen({super.key});

  @override
  State<AllBrandScreen> createState() => _AllBrandScreenState();
}

class _AllBrandScreenState extends State<AllBrandScreen> {
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
            "All Brands",
            style: TextStyle(fontSize: 18),
          ),
          elevation: 4,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<BrandListController>().getBrandList();
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: GetBuilder<BrandListController>(builder: (controller) {
                return Visibility(
                  visible: !controller.inProgressStatus,
                  replacement: circleProgressIndicatorShow(),
                  child: GridView.builder(
                    itemCount: controller.brandListModel.brandItemList?.length ?? 0,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      return FittedBox(
                        child: BrandItemWidget(
                          brandItem: controller.brandListModel.brandItemList![index],
                        ),
                      );
                    },
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
