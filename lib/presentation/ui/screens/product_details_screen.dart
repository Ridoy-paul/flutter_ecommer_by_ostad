import 'package:flutter/material.dart';
import 'package:flutter_ecommer_by_ostad/data/models/product_details_data.dart';
import 'package:flutter_ecommer_by_ostad/data/utility/helpers.dart';
import '../../state_holders/product_details_controller.dart';
import '../widgets/products/size_selector_for_product_details_widget.dart';
import '../widgets/products/color_selector_for_product_details_widget.dart';
import 'product_review_lists_screen.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import '../utility/app_colors.dart';
import '../widgets/products/product_image_carosel_widget.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId,});

  final int productId;

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
  String _selectedSize = '';

  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

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
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            'Product Details',
            style: TextStyle(fontSize: 18),
          ),
          elevation: 4,
        ),
        body: SafeArea(
          child: GetBuilder<ProductDetailsController>(builder: (controller) {
            return Visibility(
              visible: !controller.inProgressStatus,
              replacement: circleProgressIndicatorShow(),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ProductImageCarouselWidget(urls: [
                            controller.productDetailsModel.img1 ?? '',
                            controller.productDetailsModel.img2 ?? '',
                            controller.productDetailsModel.img3 ?? '',
                            controller.productDetailsModel.img4 ?? '',
                          ],),
                          productDetailsBody(controller.productDetailsModel),
                        ],
                      ),
                    ),
                  ),
                  productDetailsBottomPriceSection,
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Padding productDetailsBody(ProductDetailsData productDetailsData) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Text(
                  productDetailsData.product?.title ?? '',
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
          reviewAndRating(productDetailsData.product!.star ?? 0),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "Color",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          ColorSelector(
            colors: colors,
            onchange: (selectedColor) {
              _selectedColor = selectedColor;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "Size",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          SizeSelector(
            size: productDetailsData.size?.split(',') ?? [],
            onchange: (selectedSize) {
              _selectedSize = selectedSize;
            },
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "Description",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(productDetailsData.des ?? ''),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  Row reviewAndRating(int rating) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(
              Icons.star,
              size: 16,
              color: Colors.amber,
            ),
            Text(
              '$rating',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
        TextButton(
          onPressed: () {
            Get.to(() => const ProductReviewListsScreen());
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
          child: const Padding(
            padding: EdgeInsets.all(6.0),
            child: Icon(
              Icons.favorite_outline,
              size: 16,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
      ],
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

