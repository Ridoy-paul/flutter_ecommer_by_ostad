import 'package:flutter_ecommer_by_ostad/presentation/state_holders/wishlist/product_wishlist_controller.dart';
import 'package:get/get.dart';

import '../../../data/services/network_caller.dart';
import '../../../data/services/response_data.dart';
import '../../../data/utility/urls.dart';

class RemoveProductWishlistItemController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  bool _isSuccess = true;

  bool get inProgressStatus => _inProgress;
  String get message => _message;
  bool get isSuccess => _isSuccess;

  Future<bool> removeWishListItem(int productId) async {
    _inProgress = true;
    update();

    final ResponseData response = await NetworkCaller().getRequest(
      Urls.removeWishList(productId),
    );

    _inProgress = false;
    if(response.isSuccess) {
      if(response.responseData['data'] == 1) {
        Get.find<ProductWishlistController>().getWishlistItems();
      }
      else {
        _message = "Failed to remove!";
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