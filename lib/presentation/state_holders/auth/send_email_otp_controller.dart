import '../../../data/services/network_caller.dart';
import '../../../data/services/response_data.dart';
import '../../../data/utility/urls.dart';
import 'package:get/get.dart';

class SendEmailOTPController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  bool _isSuccess = true;

  bool get inProgressStatus => _inProgress;
  String get message => _message;
  bool get isSuccess => _isSuccess;

  Future<bool> sendEmailOTP(String email) async {
    _inProgress = true;
    update();

    final ResponseData response = await NetworkCaller().getRequest(Urls.userLoginEmailVerification(email));
    _inProgress = false;

    if(response.isSuccess) {
      _message = "A 4 digit code sent your email.";
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