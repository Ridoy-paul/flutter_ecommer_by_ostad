import 'create_product_review_data.dart';

class CreateProductReviewModel {
  String? msg;
  CreateProductReviewData? createProductReviewData;

  CreateProductReviewModel({this.msg, this.createProductReviewData});

  CreateProductReviewModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    createProductReviewData = json['data'] != null ? CreateProductReviewData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (createProductReviewData != null) {
      data['data'] = createProductReviewData!.toJson();
    }
    return data;
  }
}

