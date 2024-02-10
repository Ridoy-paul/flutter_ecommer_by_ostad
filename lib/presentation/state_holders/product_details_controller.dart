import '../../data/models/product_details_data.dart';
import '../../data/models/product_details_model.dart';
import 'package:get/get.dart';
import '../../data/services/network_caller.dart';
import '../../data/services/response_data.dart';
import '../../data/utility/urls.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  bool _isSuccess = true;

  ProductDetailsModel _productDetailsModel = ProductDetailsModel();

  ProductDetailsData get productDetailsModel => _productDetailsModel.productDetailsData!.first;

  bool get inProgressStatus => _inProgress;
  String get message => _message;
  bool get isSuccess => _isSuccess;

  Future<bool> getProductDetails(int productId) async {
    _inProgress = true;
    update();

    final ResponseData response = await NetworkCaller().getRequest(
      Urls.productDetails(productId),
    );

    _inProgress = false;
    if(response.isSuccess) {
      _productDetailsModel = ProductDetailsModel.fromJson(response.responseData);
    }
    else {
      _message = response.errorMessage;
      _isSuccess = false;
    }
    update();
    return _isSuccess;
  }
}