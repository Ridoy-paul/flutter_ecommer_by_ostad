import '../../../data/models/product_wishlist/product_wishlist_model.dart';
import 'package:get/get.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/services/response_data.dart';
import '../../../data/utility/urls.dart';

class ProductWishlistController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  bool _isSuccess = true;

  ProductWishlistModel _productWishlistModel = ProductWishlistModel();
  ProductWishlistModel get productWishlistModel => _productWishlistModel;

  bool get inProgressStatus => _inProgress;
  String get message => _message;
  bool get isSuccess => _isSuccess;

  Future<bool> getWishlistItems() async {
    _inProgress = true;
    update();

    final ResponseData response = await NetworkCaller().getRequest(
      Urls.productWishList,
    );

    _inProgress = false;
    if(response.isSuccess) {
      _productWishlistModel = ProductWishlistModel.fromJson(response.responseData);
    }
    else {
      _message = response.errorMessage;
      _isSuccess = false;
    }
    update();
    return _isSuccess;
  }
}