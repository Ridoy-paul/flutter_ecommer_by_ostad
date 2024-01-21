import 'package:flutter/material.dart';
import 'package:flutter_ecommer_by_ostad/presentation/ui/utility/app_colors.dart';
import 'package:get/get.dart';
import '../utility/assets_path.dart';
import '../widgets/category_item_widget.dart';
import '../widgets/home/circle_icon_button_widget.dart';
import '../widgets/home/image_carosel_widget.dart';
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
                SectionTitleWidget(title: "All Categories", onTapSeeAll: () {},),
                getCategoryLists,
                SectionTitleWidget(title: "Popular", onTapSeeAll: () {},),
                getPopularProductsLists,
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

  SizedBox get getPopularProductsLists {
    return SizedBox(
      height: Get.height * .24,
      child: ListView.separated(
        itemCount: 10,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.asset(
                    'assets/images/shoe.png',
                    width: 120,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "New year special shoe 30",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4,),
                      Row(
                        children: [
                          Text(
                            "\$120",
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 5,),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(Icons.star, size: 12, color: Colors.amber,),
                              Text(
                                "4.8",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            color: AppColors.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(Icons.favorite_outline, size: 12, color: Colors.white,),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
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
          onTap: () {
            print("hello");
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
