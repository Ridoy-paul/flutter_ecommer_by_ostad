import '../../data/models/home_screen_slider_list_model.dart';
import 'package:get/get.dart';
import '../../data/services/network_caller.dart';
import '../../data/services/response_data.dart';
import '../../data/utility/urls.dart';

class HomeSliderController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  bool _isSuccess = true;

  HomeScreenSliderListModel _homeScreenSliderListModel = HomeScreenSliderListModel();

  HomeScreenSliderListModel get homeScreenSliderListModel => _homeScreenSliderListModel;

  bool get inProgressStatus => _inProgress;
  String get message => _message;
  bool get isSuccess => _isSuccess;

  Future<bool> getSliderList() async {
    _inProgress = true;
    update();

    final ResponseData response = await NetworkCaller().getRequest(
      Urls.homeSliderList,
    );

    _inProgress = false;
    if(response.isSuccess) {
      _homeScreenSliderListModel = HomeScreenSliderListModel.fromJson(response.responseData);
    }
    else {
      _message = response.errorMessage;
      _isSuccess = false;
    }
    update();
    return _isSuccess;
  }
}