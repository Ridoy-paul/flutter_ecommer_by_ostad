import '../../data/models/product_list_model.dart';
import 'package:get/get.dart';
import '../../data/services/network_caller.dart';
import '../../data/services/response_data.dart';
import '../../data/utility/urls.dart';

class ProductListByBrandController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  bool _isSuccess = true;

  ProductListModel _productListModel = ProductListModel();

  ProductListModel get productListModel => _productListModel;

  bool get inProgressStatus => _inProgress;
  String get message => _message;
  bool get isSuccess => _isSuccess;

  Future<bool> getProductList(int brandId) async {
    _inProgress = true;
    update();

    final ResponseData response = await NetworkCaller().getRequest(
      Urls.listProductByBrand(brandId),
    );

    _inProgress = false;
    if(response.isSuccess) {
      _productListModel = ProductListModel.fromJson(response.responseData);
    }
    else {
      _message = response.errorMessage;
      _isSuccess = false;
    }
    update();
    return _isSuccess;
  }
}