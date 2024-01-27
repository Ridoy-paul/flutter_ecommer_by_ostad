import 'package:flutter_ecommer_by_ostad/data/models/user_profile_model.dart';
import 'package:get/get.dart';
import '../../data/services/network_caller.dart';
import '../../data/services/response_data.dart';
import '../../data/utility/urls.dart';

class ReadProfileDataController extends GetxController  {
  bool _inProgress = false;
  String _message = '';
  bool _isSuccess = true;

  bool get inProgressStatus => _inProgress;
  String get message => _message;
  bool get isSuccess => _isSuccess;

  Future<bool> readProfileInfo() async {
    _inProgress = true;
    update();

    final ResponseData response = await NetworkCaller().getRequest(Urls.userReadProfileInfo);
    _inProgress = false;

    if(response.isSuccess) {
      final profileData = response.responseData['data'];
      if(profileData == null) {
        update();
        return false;
      }
      
      UserProfileModel profileModel = UserProfileModel.fromJson(profileData[0]);
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