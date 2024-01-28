import 'package:flutter/material.dart';
import 'package:flutter_ecommer_by_ostad/presentation/state_holders/auth_controller.dart';
import 'package:flutter_ecommer_by_ostad/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:flutter_ecommer_by_ostad/presentation/ui/screens/auth/splash_screen.dart';
import 'package:flutter_ecommer_by_ostad/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:flutter_ecommer_by_ostad/presentation/ui/screens/create_product_review_screen.dart';
import 'product_review_lists_screen.dart';
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
                const HomeImageCarouselWidget(),
                SectionTitleWidget(
                  title: "All Categories",
                  onTapSeeAll: ()=> Get.find<MainBottomNavController>().changeIndex(1)
                  ,
                ),
                getCategoryLists,
                SectionTitleWidget(title: "Popular", onTapSeeAll: () {

                },),
                getProductsLists,
                SectionTitleWidget(title: "Special", onTapSeeAll: () {},),
                getProductsLists,
                SectionTitleWidget(title: "New", onTapSeeAll: () {},),
                getProductsLists,
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
      child: ListView.separated(
        itemCount: 10,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const CategoryItemWidget(
            categoryName: 'Electronics',
          );
        },
        separatorBuilder: (_, __) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }

  SizedBox get getProductsLists {
    return SizedBox(
      height: Get.height * .24,
      child: ListView.separated(
        itemCount: 10,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCardItem();
        },
        separatorBuilder: (_, __) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
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
            //await Get.find<AuthController>().clearAuthData();
            //Get.offAll(() => const VerifyEmailScreen());
            Get.offAll(() => const CompleteProfileScreen());
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