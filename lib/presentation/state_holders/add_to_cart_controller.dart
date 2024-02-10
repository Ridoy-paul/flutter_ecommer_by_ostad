import 'package:get/get.dart';
import '../../data/services/network_caller.dart';
import '../../data/services/response_data.dart';
import '../../data/utility/urls.dart';

class AddToCartController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  bool _isSuccess = true;

  bool get inProgressStatus => _inProgress;
  String get message => _message;
  bool get isSuccess => _isSuccess;

  Future<bool> addToCart(int productId, String color, String size, int qty) async {
    _inProgress = true;
    update();

    Map<String, dynamic> params =  {
        "product_id": productId,
        "color": color,
        "size": size,
        "qty": qty,
      };


    final ResponseData response = await NetworkCaller().postRequest(
      Urls.createCartList,
      body: params,
    );

    _inProgress = false;

    if(response.isSuccess) {
      update();
      return true;
    }
    else {
      _message = response.errorMessage;
      _isSuccess = false;
      update();
      return false;
    }
  }
}