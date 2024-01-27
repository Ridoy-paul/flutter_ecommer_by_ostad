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
  }
}
