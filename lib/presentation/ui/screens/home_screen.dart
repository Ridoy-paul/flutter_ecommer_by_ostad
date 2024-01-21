import 'package:flutter/material.dart';
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
      height: Get.height * .2,
      child: ListView.separated(
        itemCount: 10,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Image.asset('assets/images/shoe.png', width: 120,),
                Text("New year special shoe 30"),


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
