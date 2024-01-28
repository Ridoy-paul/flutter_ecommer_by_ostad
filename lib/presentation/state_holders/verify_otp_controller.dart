import 'read_profile_data_controller.dart';
import 'auth_controller.dart';
import 'package:get/get.dart';
import '../../data/services/network_caller.dart';
import '../../data/services/response_data.dart';
import '../../data/utility/urls.dart';

class VerifyOTPController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  bool _isSuccess = true;
  bool _shouldNavigateCompleteProfile = true;

  bool get inProgressStatus => _inProgress;
  String get message => _message;
  bool get isSuccess => _isSuccess;
  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;

  Future<bool> verifyOTP(String email, int otp) async {
    _inProgress = true;
    update();

    final ResponseData response = await NetworkCaller().getRequest(Urls.userLoginOTPVerification(email, otp));
    _inProgress = false;

    if(response.isSuccess) {
      final token = response.responseData['data'];
      Get.find<AuthController>().saveAuthToken(token);
      await Future.delayed(const Duration(seconds: 5));

      final result = await Get.find<ReadProfileDataController>().readProfileInfo();
      if(result) {
        _shouldNavigateCompleteProfile = Get.find<ReadProfileDataController>().isProfileCompleted == false;
        if(_shouldNavigateCompleteProfile == false) {
          await Get.find<AuthController>().saveAuthUserDetails(Get.find<ReadProfileDataController>().profileModel);
        }
      }
      else {
        _message = Get.find<ReadProfileDataController>().message;
        update();
        return false;
      }

      _message = "Wrong OTP! Please Try Again.";
      update();
      return true;
    }
    else {
      _message = response.errorMessage;
      _isSuccess = false;
      update();
      return false;
    }
  }

}