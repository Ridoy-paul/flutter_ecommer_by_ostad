import '../../data/models/product_review/list_review_by_product_model.dart';
import 'package:get/get.dart';
import '../../data/services/network_caller.dart';
import '../../data/services/response_data.dart';
import '../../data/utility/urls.dart';

class ListReviewByProductController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  bool _isSuccess = true;
  int _listItemQty = 0;

  ListReviewByProductModel _listReviewByProductModel = ListReviewByProductModel();

  ListReviewByProductModel get listReviewByProductModel => _listReviewByProductModel;

  int get listItemQty => _listItemQty;
  bool get inProgressStatus => _inProgress;
  String get message => _message;
  bool get isSuccess => _isSuccess;

  Future<bool> getReviewList(int productId) async {
    _inProgress = true;
    update();

    final ResponseData response = await NetworkCaller().getRequest(
      Urls.listReviewByProduct(productId),
    );

    _inProgress = false;
    if(response.isSuccess) {
      _listReviewByProductModel = ListReviewByProductModel.fromJson(response.responseData);
      _listItemQty = _listReviewByProductModel.productReviewItem!.length ?? 0;
    }
    else {
      _message = response.errorMessage;
      _isSuccess = false;
    }
    update();
    return _isSuccess;
  }
}