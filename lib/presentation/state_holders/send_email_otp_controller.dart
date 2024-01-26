import '../../data/services/network_caller.dart';
import '../../data/services/response_data.dart';
import '../../data/utility/urls.dart';
import 'package:get/get.dart';

class SendEmailOTPController extends GetxController {
  bool _inProgress = false;

  bool get inProgressStatus => _inProgress;

  Future<bool> sendEmailOTP(String email) async {
    _inProgress = true;
    update();

    final ResponseData response = await NetworkCaller().getRequest(Urls.userLoginEmailVerification(email));




  }



}