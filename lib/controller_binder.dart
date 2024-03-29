import 'presentation/state_holders/invoice/create_invoice_controller.dart';
import 'presentation/state_holders/wishlist/remove_product_wishlist_item_controller.dart';
import 'presentation/state_holders/wishlist/product_wishlist_controller.dart';
import 'presentation/state_holders/wishlist/create_wishlist_controller.dart';
import 'presentation/state_holders/create_product_review_controller.dart';
import 'presentation/state_holders/list_review_by_product_controller.dart';
import 'presentation/state_holders/delete_cart_list_controller.dart';
import 'presentation/state_holders/cart_list_controller.dart';
import 'presentation/state_holders/add_to_cart_controller.dart';
import 'presentation/state_holders/product_details_controller.dart';
import 'presentation/state_holders/product_list_by_brand_controller.dart';
import 'presentation/state_holders/brand_list_controller.dart';
import 'presentation/state_holders/all_product_list_by_remarks_controller.dart';
import 'presentation/state_holders/auth/country_state_and_city/country_state_city_processing_controller_for_shipping_info.dart';
import 'presentation/state_holders/auth/country_state_and_city/country_state_city_processing_controller.dart';
import 'presentation/state_holders/product_list_by_category_controller.dart';
import 'presentation/state_holders/new_product_list_controller.dart';
import 'presentation/state_holders/special_product_list_controller.dart';
import 'presentation/state_holders/popular_product_list_controller.dart';
import 'presentation/state_holders/category_list_controller.dart';
import 'presentation/state_holders/home_slider_controller.dart';
import 'presentation/state_holders/auth/complete_profile_controller.dart';
import 'presentation/state_holders/auth/auth_controller.dart';
import 'presentation/state_holders/auth/read_profile_data_controller.dart';
import 'presentation/state_holders/auth/verify_otp_screen_resend_otp_controller.dart';
import 'presentation/state_holders/auth/verify_otp_controller.dart';
import 'presentation/state_holders/auth/send_email_otp_controller.dart';
import 'presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(SendEmailOTPController());
    Get.put(VerifyOTPController());
    Get.put(VerifyOTPScreenResendOTPController());
    Get.put(ReadProfileDataController());
    Get.put(AuthController());
    Get.put(CompleteProfileController());
    Get.put(HomeSliderController());
    Get.put(CategoryListController());
    Get.put(PopularProductListController());
    Get.put(SpecialProductListController());
    Get.put(NewProductListController());
    Get.put(ProductListByCategoryController());
    Get.put(CountryStateCityProcessingController());
    Get.put(CountryStateCityProcessingControllerForShippingInfo());
    Get.put(AllProductListByRemarksController());
    Get.put(BrandListController());
    Get.put(ProductListByBrandController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(CartListController());
    Get.put(DeleteCartListController());
    Get.put(ListReviewByProductController());
    Get.put(CreateProductReviewController());
    Get.put(CreateWishListController());
    Get.put(ProductWishlistController());
    Get.put(RemoveProductWishlistItemController());
    Get.put(CreateInvoiceController());




  }
}
