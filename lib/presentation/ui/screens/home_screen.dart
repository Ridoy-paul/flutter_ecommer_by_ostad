import 'package:flutter/material.dart';
import '../../../data/utility/helpers.dart';
import '../../state_holders/category_list_controller.dart';
import '../../state_holders/new_product_list_controller.dart';
import '../../state_holders/popular_product_list_controller.dart';
import '../../state_holders/special_product_list_controller.dart';
import '../../state_holders/home_slider_controller.dart';
import '../../state_holders/auth_controller.dart';
import 'auth/complete_profile_screen.dart';
import 'auth/verify_email_screen.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import 'package:get/get.dart';
import '../utility/assets_path.dart';
import '../widgets/category_item_widget.dart';
import '../widgets/home/circle_icon_button_widget.dart';
import '../widgets/home/image_carosel_widget.dart';
import '../widgets/products/product_card_item.dart';
import '../widgets/section_title_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 8,),
                searchTextFormField,
                const SizedBox(height: 16,),
                SizedBox(
                  height: 150,
                  child: GetBuilder<HomeSliderController>(
                      builder: (homeSliderController) {
                        return Visibility(
                          visible: !homeSliderController.inProgressStatus,
                          replacement: circleProgressIndicatorShow(),
                          child: HomeImageCarouselWidget(
                            sliderList: homeSliderController.homeScreenSliderListModel.sliderList ?? [],),
                        );
                      }),
                ),
                SectionTitleWidget(
                  title: "All Categories",
                  onTapSeeAll: () =>
                      Get.find<MainBottomNavController>().changeIndex(1),
                ),
                getCategoryLists,
                SectionTitleWidget(title: "Popular", onTapSeeAll: () {

                },),
                getPopularProductsLists,
                SectionTitleWidget(title: "Special", onTapSeeAll: () {},),
                getSpecialProductsLists,
                SectionTitleWidget(title: "New", onTapSeeAll: () {},),
                getNewProductsLists,
                const SizedBox(height: 10,),

              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox get getCategoryLists {
    return SizedBox(
      height: Get.height * .15,
      child: GetBuilder<CategoryListController>(
          builder: (categoryListController) {
            return Visibility(
              visible: !categoryListController.inProgressStatus,
              replacement: circleProgressIndicatorShow(),
              child: ListView.separated(
                itemCount: categoryListController.categoryListModel.categoryList
                    ?.length ?? 0,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryItemWidget(
                    categoryItem: categoryListController.categoryListModel
                        .categoryList![index],
                  );
                },
                separatorBuilder: (_, __) {
                  return const SizedBox(
                    width: 8,
                  );
                },
              ),
            );
          }),
    );
  }

  SizedBox get getPopularProductsLists {
    return SizedBox(
      height: Get.height * .24,
      child: GetBuilder<PopularProductListController>(builder: (popularProductController) {
        return Visibility(
          visible: !popularProductController.inProgressStatus,
          replacement: circleProgressIndicatorShow(),
          child: ListView.separated(
            itemCount: popularProductController.popularProductModel.productList?.length ?? 0,
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductCardItem(productItem: popularProductController.popularProductModel.productList![index],);
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                width: 8,
              );
            },
          ),
        );
      }),
    );
  }

  SizedBox get getSpecialProductsLists {
    return SizedBox(
      height: Get.height * .24,
      child: GetBuilder<SpecialProductListController>(builder: (specialProductController) {
        return Visibility(
          visible: !specialProductController.inProgressStatus,
          replacement: circleProgressIndicatorShow(),
          child: ListView.separated(
            itemCount: specialProductController.popularProductModel.productList?.length ?? 0,
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductCardItem(productItem: specialProductController.popularProductModel.productList![index],);
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                width: 8,
              );
            },
          ),
        );
      }),
    );
  }

  SizedBox get getNewProductsLists {
    return SizedBox(
      height: Get.height * .24,
      child: GetBuilder<NewProductListController>(builder: (newProductController) {
        return Visibility(
          visible: !newProductController.inProgressStatus,
          replacement: circleProgressIndicatorShow(),
          child: ListView.separated(
            itemCount: newProductController.popularProductModel.productList?.length ?? 0,
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductCardItem(productItem: newProductController.popularProductModel.productList![index],);
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                width: 8,
              );
            },
          ),
        );
      }),
    );
  }

  TextFormField get searchTextFormField {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Search",
        filled: true,
        prefixIcon: const Icon(Icons.search),
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      title: Image.asset(AssetsPath.logoNav),
      actions: [
        CircleIconButton(
          onTap: () async {
            await Get.find<AuthController>().clearAuthData();
            Get.offAll(() => const VerifyEmailScreen());
            // Get.offAll(() => const CompleteProfileScreen());
          },
          iconData: Icons.person_outline,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {
            print("hello");
          },
          iconData: Icons.call_outlined,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {
            print("hello");
          },
          iconData: Icons.notification_important_outlined,
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }

}