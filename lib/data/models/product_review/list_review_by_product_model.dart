import 'product_review_item.dart';

class ListReviewByProductModel {
  String? msg;
  List<ProductReviewItem>? productReviewItem;

  ListReviewByProductModel({this.msg, this.productReviewItem});

  ListReviewByProductModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productReviewItem = <ProductReviewItem>[];
      json['data'].forEach((v) {
        productReviewItem!.add(ProductReviewItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (productReviewItem != null) {
      data['data'] = productReviewItem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
