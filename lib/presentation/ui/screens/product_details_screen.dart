import 'package:flutter/material.dart';
import 'product_review_lists_screen.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import '../utility/app_colors.dart';
import '../widgets/products/product_image_carosel_widget.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  List<Color> colors = [
    Color(0xFF343541),
    Color(0xFFBF0D4C),
    Color(0xFF0524EA),
    Color(0xFF99F50C),
    Color(0xFFDC09A0),
    Color(0xFFE3D509),
  ];

  Color _selectedColor = Colors.black54;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70,
          leading: IconButton(
            onPressed: ()=> Get.back(),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            'Product Details',
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
                    ProductImageCarouselWidget(),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text(
                                  "Happy New Year Special Deal Save 30% test product",
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              ItemCount(
                                color: AppColors.primaryColor,
                                initialValue: 2,
                                minValue: 1,
                                maxValue: 100,
                                decimalPlaces: 0,
                                onChanged: (v) {
                                  //noOfItem.value = v.toInt();
                                },
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(Icons.star, size: 16, color: Colors.amber,),
                                  Text(
                                    "4.8",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),

                              TextButton(
                                onPressed: () {
                                  Get.to(()=> ProductReviewListsScreen());
                                },
                                child: const Text(
                                  "Reviews",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),

                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                color: AppColors.primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Icon(Icons.favorite_outline, size: 16, color: Colors.white,),
                                ),
                              ),
                              const SizedBox(width: 5,),
                            ],
                          ),
                          const SizedBox(height: 8,),
                          const Text("Color", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                          Row(
                            children: colors
                                .map((c) => InkWell(
                                    onTap: () {
                                      _selectedColor = c;
                                      if(mounted) {
                                        setState(() {});
                                      }
                                    },
                                    borderRadius: BorderRadius.circular(16),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 2,
                                        horizontal: 3,
                                      ),
                                      child: CircleAvatar(
                                        radius: 16,
                                        backgroundColor: c,
                                        child: _selectedColor == c ? Icon(Icons.done, color: Colors.white,) : null,

                                      ),
                                    ),
                                  ),
                                ).toList(),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              productDetailsBottomPriceSection,
            ],
          ),
        ),
      ),
    );
  }

  Container get productDetailsBottomPriceSection {
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
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Text(
                  "\$10000.00",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Add To Cart"),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
