import 'package:get/get.dart';

import '../../data/services/network_caller.dart';
import '../../data/services/response_data.dart';
import '../../data/utility/urls.dart';
import 'cart_list_controller.dart';

class DeleteCartListController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  bool _isSuccess = true;

  bool get inProgressStatus => _inProgress;
  String get message => _message;
  bool get isSuccess => _isSuccess;

  Future<bool> deleteCartListItem(int productId) async {
    _inProgress = true;
    update();

    final ResponseData response = await NetworkCaller().getRequest(
      Urls.deleteCartList(productId),
    );

    _inProgress = false;
    if(response.isSuccess) {
      if(response.responseData['data'] == 1) {
        Get.find<CartListController>().getCartList();
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