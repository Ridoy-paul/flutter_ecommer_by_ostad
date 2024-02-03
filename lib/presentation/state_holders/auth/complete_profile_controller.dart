import '../../../data/models/params/create_profile_params.dart';
import '../../../data/models/user_profile_model.dart';
import 'package:get/get.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/services/response_data.dart';
import '../../../data/utility/urls.dart';
import 'auth_controller.dart';

class CompleteProfileController extends GetxController  {
  bool _inProgress = false;
  String _message = '';
  bool _isSuccess = true;

  UserProfileModel _profile = UserProfileModel();

  bool get inProgressStatus => _inProgress;
  String get message => _message;
  bool get isSuccess => _isSuccess;

  Future<bool> createUserProfile(CreateProfileParams params) async {
    _inProgress = true;
    update();

    final ResponseData response = await NetworkCaller().postRequest(
      Urls.createProfile,
      body: params.toJson(),
    );

    _inProgress = false;

    if(response.isSuccess) {
      _profile = UserProfileModel.fromJson(response.responseData['data']);
      await Get.find<AuthController>().saveAuthUserDetails(_profile);
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