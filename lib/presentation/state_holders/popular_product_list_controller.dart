import '../../data/models/popular_product_model.dart';
import 'package:get/get.dart';
import '../../data/services/network_caller.dart';
import '../../data/services/response_data.dart';
import '../../data/utility/urls.dart';

class PopularProductListController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  bool _isSuccess = true;

  PopularProductModel _popularProductModel = PopularProductModel();

  PopularProductModel get popularProductModel => _popularProductModel;

  bool get inProgressStatus => _inProgress;
  String get message => _message;
  bool get isSuccess => _isSuccess;

  Future<bool> getProductList() async {
    _inProgress = true;
    update();

    final ResponseData response = await NetworkCaller().getRequest(
      Urls.popularProductList,
    );

    _inProgress = false;
    if(response.isSuccess) {
      _popularProductModel = PopularProductModel.fromJson(response.responseData);
    }
    else {
      _message = response.errorMessage;
      _isSuccess = false;
    }
    update();
    return _isSuccess;
  }
}