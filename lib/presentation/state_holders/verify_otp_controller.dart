import 'dart:developer';
import 'package:flutter_ecommer_by_ostad/presentation/state_holders/read_profile_data_controller.dart';

import 'auth_controller.dart';
import 'package:get/get.dart';
import '../../data/services/network_caller.dart';
import '../../data/services/response_data.dart';
import '../../data/utility/urls.dart';

class VerifyOTPController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  bool _isSuccess = true;

  bool get inProgressStatus => _inProgress;
  String get message => _message;
  bool get isSuccess => _isSuccess;

  Future<bool> verifyOTP(String email, int otp) async {
    _inProgress = true;
    update();

    final ResponseData response = await NetworkCaller().getRequest(Urls.userLoginOTPVerification(email, otp));
    _inProgress = false;

    if(response.isSuccess) {
      final token = response.responseData['data'];
      await Get.find<AuthController>().saveAuthToken(token);
      await Get.find<ReadProfileDataController>().readProfileInfo();
      //final profileData
      _message = "Verification Success.";
      update();
      return true;
    }
    else {
      _message = response.errorMessage!;
      _isSuccess = false;
      update();
      return false;
    }
  }

}