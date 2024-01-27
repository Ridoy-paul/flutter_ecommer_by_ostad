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

  Future<bool> readProfileInfo(String token) async {
    _inProgress = true;
    update();

    final ResponseData response = await NetworkCaller().getRequest(Urls.userReadProfileInfo, token: token);
    _inProgress = false;

    if(response.isSuccess) {
      final profileData = response.responseData['data'];
      if(profileData == null) {
        update();
        return false;
      }
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