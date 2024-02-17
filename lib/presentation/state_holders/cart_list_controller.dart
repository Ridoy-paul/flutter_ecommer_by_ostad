import 'package:flutter_ecommer_by_ostad/data/models/cart_list_item.dart';
import 'package:get/get.dart';
import '../../data/models/cart_list_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/services/response_data.dart';
import '../../data/utility/urls.dart';

class CartListController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  bool _isSuccess = true;

  final RxDouble _cartTotal = 0.0.obs;

  RxDouble get cartTotal => _cartTotal;

  CartListModel _cartListModel = CartListModel();
  CartListModel get cartListModel => _cartListModel;

  bool get inProgressStatus => _inProgress;
  String get message => _message;
  bool get isSuccess => _isSuccess;

  Future<bool> getCartList() async {
    _inProgress = true;
    update();

    final ResponseData response = await NetworkCaller().getRequest(
      Urls.cartList,
    );

    _inProgress = false;
    if(response.isSuccess) {
      _cartListModel = CartListModel.fromJson(response.responseData);
      _cartTotal.value = _calculateCartTotal;
    }
    else {
      _message = response.errorMessage;
      _isSuccess = false;
    }
    update();
    return _isSuccess;
  }

  double get _calculateCartTotal {
    double total = 0;
    for(CartListItem item in _cartListModel.cartListItem ?? []) {
      double price = double.tryParse(item.product?.price ?? '0') ?? 0;
      double quantity = double.tryParse(item.qty ?? '0') ?? 0;
      total += price * quantity;
    }
    return total;
  }



}