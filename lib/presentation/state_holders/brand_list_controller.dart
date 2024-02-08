import '../../data/models/brand_list_model.dart';
import 'package:get/get.dart';
import '../../data/services/network_caller.dart';
import '../../data/services/response_data.dart';
import '../../data/utility/urls.dart';

class BrandListController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  bool _isSuccess = true;

  BrandListModel _brandListModel = BrandListModel();
  BrandListModel get brandListModel => _brandListModel;

  bool get inProgressStatus => _inProgress;
  String get message => _message;
  bool get isSuccess => _isSuccess;

  Future<bool> getBrandList() async {
    _inProgress = true;
    update();

    final ResponseData response = await NetworkCaller().getRequest(
      Urls.brandList,
    );

    _inProgress = false;
    if(response.isSuccess) {
      _brandListModel = BrandListModel.fromJson(response.responseData);
    }
    else {
      _message = response.errorMessage;
      _isSuccess = false;
    }
    update();
    return _isSuccess;
  }
}