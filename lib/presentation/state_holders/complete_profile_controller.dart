import '../../data/models/user_profile_model.dart';
import 'package:get/get.dart';
import '../../data/services/network_caller.dart';
import '../../data/services/response_data.dart';
import '../../data/utility/urls.dart';
import 'auth_controller.dart';

class CompleteProfileController extends GetxController  {
  bool _inProgress = false;
  String _message = '';
  bool _isSuccess = true;

  UserProfileModel _profileModel = UserProfileModel();

  bool get inProgressStatus => _inProgress;
  String get message => _message;
  bool get isSuccess => _isSuccess;

  Future<bool> createUserProfile(String firstName, String lastName, int mobile, String city, String address) async {
    _inProgress = true;
    update();

    Map<String, dynamic> formInputData = {
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "city": city,
      "shippingAddress": address
    };

    final ResponseData response = await NetworkCaller().postRequest(
      Urls.createProfile,
      body: formInputData,
    );

    _inProgress = false;

    if(response.isSuccess) {
      _profileModel = UserProfileModel.fromJson(response.responseData['data']);
      await Get.find<AuthController>().saveAuthUserDetails(_profileModel);

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