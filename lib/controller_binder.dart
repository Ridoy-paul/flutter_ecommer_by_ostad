import 'presentation/state_holders/popular_product_list_controller.dart';
import 'presentation/state_holders/category_list_controller.dart';
import 'presentation/state_holders/home_slider_controller.dart';
import 'presentation/state_holders/complete_profile_controller.dart';
import 'presentation/state_holders/auth_controller.dart';
import 'presentation/state_holders/read_profile_data_controller.dart';
import 'presentation/state_holders/verify_otp_screen_resend_otp_controller.dart';
import 'presentation/state_holders/verify_otp_controller.dart';
import 'presentation/state_holders/send_email_otp_controller.dart';
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


  }
}
