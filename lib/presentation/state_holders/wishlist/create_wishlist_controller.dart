import 'package:get/get.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/services/response_data.dart';
import '../../../data/utility/urls.dart';


class CreateWishListController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  bool _isSuccess = true;

  bool get inProgressStatus => _inProgress;
  String get message => _message;
  bool get isSuccess => _isSuccess;

  Future<bool> addToWishlist(int productId) async {
    _inProgress = true;
    update();

    final ResponseData response = await NetworkCaller().getRequest(
      Urls.createWishList(productId),
    );

    _inProgress = false;
    if(response.isSuccess) {
      if(response.responseData['data'] != []) {
        _isSuccess = true;
      }
      else {
        _message = "Failed to add wishlist!";
        _isSuccess = false;
      }
    }
    else {
      _message = response.errorMessage;
      _isSuccess = false;
    }
    update();
    return _isSuccess;
  }
}