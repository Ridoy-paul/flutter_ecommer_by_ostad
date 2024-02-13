import 'package:flutter/material.dart';
import 'package:flutter_ecommer_by_ostad/presentation/state_holders/wishlist/create_wishlist_controller.dart';
import '../../../data/models/product_details_data.dart';
import '../../../data/utility/helpers.dart';
import '../../state_holders/add_to_cart_controller.dart';
import '../../state_holders/auth/auth_controller.dart';
import 'auth/verify_email_screen.dart';
import '../../state_holders/product_details_controller.dart';
import '../utility/show_snack_message.dart';
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
  final CreateWishListController _createWishListController = CreateWishListController();

  ValueNotifier<int> noOfItem = ValueNotifier(1);

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
            if(controller.inProgressStatus) {
              return circleProgressIndicatorShow();
            }
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
                  productDetailsBottomPriceSection(controller.productDetailsModel.product?.id ?? 0),
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
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium,
                ),
              ),
              ValueListenableBuilder(
                  valueListenable: noOfItem,
                  builder: (context, value, _) {
                    return ItemCount(
                      color: AppColors.primaryColor,
                      initialValue: value,
                      minValue: 1,
                      maxValue: 100,
                      decimalPlaces: 0,
                      onChanged: (v) {
                        noOfItem.value = v.toInt();
                      },
                    );
                  }
              ),
            ],
          ),
          reviewAndRating(productDetailsData.product!.id ?? 0, productDetailsData.product!.star ?? 0),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "Color",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          ColorSelector(
            colors: productDetailsData.color?.split(',').map((e) =>
                getColorInput(e)).toList() ?? [],
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

  Row reviewAndRating(int productId, int rating) {
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
            Get.to(() => ProductReviewListsScreen(productId: productId,),);
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
        InkWell(
          onTap: () async {
            final bool response = await _createWishListController.addToWishlist(productId);
            if (response) {
              if(_createWishListController.isSuccess) {
                showSnackMessage("Added To Wishlist.");
              }
              else {
                showSnackMessage("Something is Error!.", false);
              }
            } else {
              showSnackMessage(_createWishListController.message, false);
            }

          },
          child: Card(
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
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }

  Container productDetailsBottomPriceSection(int productId) {
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
              child: GetBuilder<AddToCartController>(builder: (addToCartController) {
                return Visibility(
                  visible: !addToCartController.inProgressStatus,
                  replacement: circleProgressIndicatorShow(),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_selectedColor != null && _selectedSize != null) {
                        if (Get.find<AuthController>().isTokenNotNull) {
                          final selectedColorName = colorToString(_selectedColor);
                          final response = await addToCartController.addToCart(productId, selectedColorName.toString(), _selectedSize.toString(), noOfItem.value);
                          if(response) {
                            showSnackMessage('This product has been added to cart.');
                          }
                          else {
                            showSnackMessage('Add to cart failed!', false);
                          }
                        }
                        else {
                          Get.to(() => const VerifyEmailScreen());
                        }
                      }
                      else {
                        showSnackMessage('Add to cart failed!', false);
                      }
                    },
                    child: const Text("Add To Cart"),
                  ),
                );
              },),
            ),
          ],
        ),
      ),
    );
  }

  Color getColorInput(String inputColor) {
    if (inputColor == 'Red') {
      return Colors.red;
    }
    else if (inputColor == 'Green') {
      return Colors.green;
    }
    else if (inputColor == 'White') {
      return Colors.white;
    }
    return Colors.transparent;
  }

  String colorToString(Color color) {
    if (color == Colors.red) {
      return 'Red';
    } else if (color == Colors.white) {
      return 'White';
    } else if (color == Colors.green) {
      return 'Green';
    }
    return 'Grey';
  }


}

