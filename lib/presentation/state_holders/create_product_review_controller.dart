import '../../data/models/product_review/create_product_review_model.dart';
import 'package:get/get.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/services/response_data.dart';
import '../../../data/utility/urls.dart';

class CreateProductReviewController extends GetxController  {
  bool _inProgress = false;
  String _message = '';
  bool _isSuccess = true;

  CreateProductReviewModel _createProductReviewModel = CreateProductReviewModel();

  bool get inProgressStatus => _inProgress;
  String get message => _message;
  bool get isSuccess => _isSuccess;

  Future<bool> submitReviewData(String description, int productId, double rating) async {
    _inProgress = true;
    update();

    final Map<String, dynamic> reviewInput = {
      "description": description,
      "product_id": productId,
      "rating": rating
    };

    final ResponseData response = await NetworkCaller().postRequest(
      Urls.createProductReview,
      body: reviewInput,
    );

    _inProgress = false;
    if(response.isSuccess) {
      _createProductReviewModel = CreateProductReviewModel.fromJson(response.responseData['data']);
      if(_createProductReviewModel == []) {
        _isSuccess = false;
      }
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